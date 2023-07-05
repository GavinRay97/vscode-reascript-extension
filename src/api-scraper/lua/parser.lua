-- This is a modified Ultraschall Docs Engine which doesn't require the rest of the API or to be run within REAPER
-- IE, it is standalone
local ultraschall = require("ultraschall_doc_engine")
local json = require("json")
local pretty_print = require("pprint")

local parser = {}

---------------------
-- HELPERS
---------------------

table.filter = function(t, filterIter)
    local out = {}

    for k, v in pairs(t) do
        if filterIter(v, k, t) then
            table.insert(out, v)
        end
    end

    return out
end

local function split(str, sep)
    local result = {}
    local regex = ("([^%s]+)"):format(sep)
    for each in str:gmatch(regex) do
        table.insert(result, each)
    end
    return result
end

local function parse_params_or_retvals(items)
    local results = {}
    if items ~= nil then
        for _, item_tuple in pairs(items) do
            local identifier, description = table.unpack(item_tuple)
            results[#results + 1] = {
                identifier = identifier,
                description = description
            }
        end
    end
    return results
end

local function process_title(doctext, idx)
    local title, spok_lang = ultraschall.Docs_GetUSDocBloc_Title(doctext, idx)
    return { title = title, spok_lang = spok_lang }
end

local function process_chapter_context(doctext, idx)
    local count, chapters, spok_lang = ultraschall.Docs_GetUSDocBloc_ChapterContext(doctext, idx)
    return { count = count, chapters = chapters, spok_lang = spok_lang }
end

local function process_description(doctext, idx)
    local description, markup_type, markup_version, indent, language, prog_lang =
        ultraschall.Docs_GetUSDocBloc_Description(doctext, true, idx)
    return {
        description = description,
        markup_type = markup_type,
        language = language,
        prog_lang = prog_lang
    }
end

local function process_functioncall(doctext, idx)
    local functioncall, prog_lang = ultraschall.Docs_GetUSDocBloc_Functioncall(doctext, idx)
    return { functioncall = functioncall, prog_lang = prog_lang }
end

local function process_target_document(doctext)
    return ultraschall.Docs_GetUSDocBloc_TargetDocument(doctext)
end

local function process_source_document(doctext)
    return ultraschall.Docs_GetUSDocBloc_SourceDocument(doctext)
end

local function process_tags(doctext, idx)
    local tags_count, tags = ultraschall.Docs_GetUSDocBloc_Tags(doctext, idx)
    return { tags_count = tags_count, tags = tags }
end

local function process_params(doctext, idx)
    local param_count, params, markup_type, markup_version, prog_lang, spok_lang, indent =
        ultraschall.Docs_GetUSDocBloc_Params(doctext, true, idx)

    return {
        param_count = param_count,
        entries = parse_params_or_retvals(params),
        markup_type = markup_type,
        prog_lang = prog_lang
    }
end

local function process_return_values(doctext, idx)
    local param_count, params, markup_type, markup_version, prog_lang, spok_lang, indent =
        ultraschall.Docs_GetUSDocBloc_Retvals(doctext, true, idx)
    return {
        param_count = param_count,
        entries = parse_params_or_retvals(params),
        markup_type = markup_type,
        prog_lang = prog_lang
    }
end

local function process_requires(doctext)
    local count, requires, requires_alt = ultraschall.Docs_GetUSDocBloc_Requires(doctext)
    return { count = count, requires = requires, requires_alt = requires_alt }
end

local function parse_eel_method_signature(functioncall_string)
    local lparen_idx, rparen_idx = string.find(functioncall_string, "%("), string.find(functioncall_string, "%)")

    if lparen_idx == nil or rparen_idx == nil then
        return
    end

    local declaration = string.sub(functioncall_string, 0, lparen_idx - 1)
    local argument_string = string.sub(functioncall_string, lparen_idx + 1, rparen_idx - 1)

    local return_type, method_name = table.unpack(split(declaration, " "))

    local signature = {
        method_name = method_name,
        parameters = {},
        return_values = {
            return_type
        }
    }

    local arguments = split(argument_string, ",")
    for _, arg in ipairs(arguments) do
        local params = split(arg, " ")
        if #params == 1 then
            signature.parameters[#signature.parameters + 1] = {
                identifier = params[1] -- "starttime"
            }
        end
        if #params == 2 then
            signature.parameters[#signature.parameters + 1] = {
                type_name = params[1], -- "MediaTrack"
                identifier = params[2] -- "track"
            }
        end
        if #params == 3 then
            signature.parameters[#signature.parameters + 1] = {
                modifier = params[1],  -- "optional"
                type_name = params[2], -- "bool"
                identifier = params[3] -- "someVariable"
            }
        end
    end

    return signature
end

-- TODO: Write this better, like the EEL one, which handles modifiers like "optional" etc.
--
-- Parse Lua method signature, returning table with "method_name", and sub-tables
-- "parameters" and "return_values", which have fields "identifier" and "type"
local function parse_lua_method_signature(functioncall_string)
    local method_identifier_regex = "([_%w]+%.[_%w]+).+%)"
    local type_identifier_regex = "([_%w]+) ([_%w]+),?"

    local _, _, method_name = string.find(functioncall_string, method_identifier_regex)

    local signature = {
        method_name = method_name,
        parameters = {},
        return_values = {}
    }

    -- Process function parameters
    -- Void method call, like "reaper.adjustZoom(...)" with no return values
    if not string.find(functioncall_string, "=") then
        local parameters = string.gmatch(functioncall_string, type_identifier_regex)
        for type_name, identifier in parameters do
            signature.parameters[#signature.parameters + 1] = { type = type_name, identifier = identifier }
        end
        return signature
    end

    local return_val_string, methodcall = table.unpack(split(functioncall_string, "="))
    local return_vals = split(return_val_string, ",")

    local parameters = string.gmatch(methodcall, type_identifier_regex)
    for type_name, identifier in parameters do
        signature.parameters[#signature.parameters + 1] = { type = type_name, identifier = identifier }
    end

    -- If return_vals is a string, only a single return value
    if #return_vals == 1 then
        local type_name, identifier = table.unpack(split(return_vals[1], " "))
        signature.return_values[#signature.return_values + 1] = { type = type_name, identifier = identifier }
        return signature
    end

    for type_name, identifier in string.gmatch(return_val_string, type_identifier_regex) do
        signature.return_values[#signature.return_values + 1] = { type = type_name, identifier = identifier }
    end

    return signature
end

---------------------
-- MAIN
---------------------

local function process_USDocML_text(filepath)
    local docfile = io.open(filepath, "r")
    local doctext = docfile:read("*a")
    local _, docblocks = ultraschall.Docs_GetAllUSDocBlocsFromString(doctext)

    local results = {}
    for idx, entry in ipairs(docblocks) do
        local title = process_title(entry, 1)
        local tags = process_tags(entry, 1)
        local description = process_description(entry, 1)
        local chapter_context = process_chapter_context(entry, 1)
        local target_document = process_target_document(entry)
        local source_document = process_source_document(entry)
        local params = process_params(entry, 1)
        local return_values = process_return_values(entry, 1)
        local requires = process_requires(entry)

        local signatures = {}
        local functioncall = {}

        for function_idx = 1, 4 do
            local func = process_functioncall(entry, function_idx)
            if func ~= nil and func.prog_lang ~= nil then
                functioncall[func.prog_lang] = func.functioncall
                if func.prog_lang == "lua" then
                    signatures.lua = parse_lua_method_signature(func.functioncall)
                end
                if func.prog_lang == "eel" then
                    signatures.eel = parse_eel_method_signature(func.functioncall)
                end
            end
        end

        local table = {
            title = title.title,
            tags = tags.tags,
            requires = requires.requires_alt,
            description = description,
            chapters = chapter_context.chapters,
            target_document = target_document,
            source_document = source_document,
            functioncall = functioncall,
            signatures = signatures,
            params = params,
            return_values = return_values
        }

        results[#results + 1] = table
    end

    return results
end

function parser.parse()
    local unfiltered_api = process_USDocML_text(
        "./docs/Reaper_Api_Documentation.USDocML")

    local sections_to_filter = {
        "1 Introduction to ReaScript",
        "2.1 CPP Api-Description",
        "2.2 EEL Api-Description",
        "2.3 Python Api-Description",
        "2.4 Lua Api-Description",
        "3 Datatypes used in this document"
    }

    local function not_an_intro_section(entry)
        for _, section in pairs(sections_to_filter) do
            if entry.title == section then
                return false
            end
        end
        return true
    end

    local reascript_core_api =
        table.filter(
            unfiltered_api,
            function(it)
                return not_an_intro_section(it)
            end
        )
    return reascript_core_api
end

function parser.writeJSON()
    local reascript_core_api = parse()
    local outfile = io.open("results.json", "w")
    outfile:write(json.encode(reascript_core_api))
    outfile:close()

    print("Finished!")
end

return parser
