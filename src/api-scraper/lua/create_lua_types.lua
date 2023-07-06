---check that the signature is a SignaturesClass
---and has a lua or eel property
---@param signature unknown
local function isSignaturesClass(signature)
	return type(signature) == "table" and (signature.lua ~= nil or signature.eel ~= nil)
end

---@param Table table
local function hasLuaProp(Table)
	return Table.lua ~= nil
end


---api docs have a lot of reserved words
---in them, so we're just adding an undersore at the end of them
---so they get parsed correctly by lua
---@param str string
---@param isOptional? boolean
---@return string
local function rewriteLuaReservedWords(str, isOptional)
	local retval = ""
	if str == "end" then
		retval = "end_"
	elseif (str == "function") then
		retval = "function_"
	elseif (str == "in") then
		retval = "in_"
	else
		retval = str
	end
	if isOptional ~= nil and isOptional == true then
		retval = retval .. "?"
	end
	return retval
end

---format ReturnValueElement's params
---according to their use, whether for
---a params in a function declaration docstring,
---or a param type, or a return type.
---
--- The format followed is
---```lua
--- ---@param one_param_perline type_of_param
--- ---@param another_param_here type_of_param
--- ---@return retval_type ret_val_name, retval_type another_retval_name
--- function(one_param_perline, another_param_here) end
---```
---@param parameters ReturnValueElement[]
---@param decl_or_type "declaration" | "type" | "return"
local function rewriteParams(parameters, decl_or_type)
	local formatted_params = ""
	for _, param in pairs(parameters) do
		if decl_or_type == "declaration" then
			formatted_params = formatted_params ..
					(formatted_params:len() > 0 and ", " or "") .. rewriteLuaReservedWords(param.identifier or "")
		elseif decl_or_type == "type" then
			formatted_params = formatted_params ..
					string.format("---@param %s %s\n", rewriteLuaReservedWords(param.identifier, param.isOptional), param.type)
		else
			local formatted_type = param.isOptional ~= nil and param.isOptional == true and param.type .. "|nil" or param.type
			formatted_params = formatted_params .. (formatted_params:len() > 0 and ", " or "") ..
					string.format("%s %s", formatted_type,
						rewriteLuaReservedWords(param.identifier or ""))
		end
	end
	return formatted_params
end

---@param def string
---@return string
local function formatDescription(def)
	local wo_dbl_lnbrk = def:gsub("\n\n", "")
	local t = wo_dbl_lnbrk:gsub("\n", "\n---")
	return "---" .. t .. "\n"
end

---get the function call without its parameters and annotations
---@param fncall string
---@return string
local function formatLuaFunctionCall(fncall)
	return fncall:reverse():gsub("%)[^%(]*%(", ""):gsub(" .*$", ""):reverse()
end

---@param functioncall Functioncall
---@return boolean
local function isNotImGui(functioncall)
	return functioncall.lua:match("ImGui") == nil
end

---@param def ReaScriptUSDocML
---@return string
local function formatDefinition(def)
	if isSignaturesClass(def.signatures) and hasLuaProp(def.functioncall) --[[ and isNotImGui(def.functioncall)  ]] then
		local parameters = def.signatures.lua.parameters
		local return_values = def.signatures.lua.return_values

		-- format everything
		local params_decl = rewriteParams(parameters, "declaration")
		local params_type = rewriteParams(parameters, "type")
		local ret_type = rewriteParams(return_values, "return")
		local retval_type = ret_type:len() > 0 and string.format("---@return %s\n", ret_type) or ""
		local fmtd_call = formatLuaFunctionCall(def.functioncall.lua)
		local desc = ""
		if (def.description.description:len() > 0) then
			desc = formatDescription(def.description.description)
		end
		return string.format("%s%s%sfunction %s(%s) end\n", desc, params_type, retval_type, fmtd_call, params_decl)
	else
		return ""
	end
end


---@param T string[]
local function concatenateTable(T)
	local ret_str = ""
	for idx, str in pairs(T) do
		ret_str = ret_str .. str .. (idx ~= #T and "\n" or "")
	end
	return ret_str
end

---write a  typedefinitions file from the provided table.
---File starts with "---@meta".
---Then, for each function mentioned in the table,
---follow the pattern:
--- ```lua
--- ---@param param param_type
--- ---@param param2 param2_type
--- ---@return return_type ret_val, return_type2 ret_val2
--- function mything(tracks) end
---```
---@param definitions ReaScriptUSDocML[]
local function writeLuaTypes(definitions)
	local metaTag = "---@meta\nreaper = {}\ngfx = {}\n\n"
	local formattedDefinitions = table.map(definitions, formatDefinition)
	return metaTag .. concatenateTable(formattedDefinitions)
end

local create_lua_types = {}

---write the lua types definitions to a file in the resources folder, at the root
---@param definitions ReaScriptUSDocML[]
function create_lua_types.create_lua_types(definitions)
	local lua_types = writeLuaTypes(definitions)
	local outpath = "resources/reaper-types.lua"

	local outfile = io.open(outpath, "w")
	if outfile then
		outfile:write(lua_types)
		outfile:close()
	else
		print("Could not open file for writing: " .. outpath)
	end
end

return create_lua_types
