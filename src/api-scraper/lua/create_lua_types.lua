local parser = require("parser")

---@param signature unknown
local function isSignaturesClass(signature)
	return type(signature) == "table" and (signature.lua ~= nil or signature.eel ~= nil)
end

---@param Table table
local function hasLuaProp(Table)
	return Table.lua ~= nil
end

---@param str string
---@return string
local function rewriteLuaReservedWords(str)
	if str == "end" then
		return "end_"
	elseif (str == "function") then
		return "function_"
	elseif (str == "in") then
		return "in_"
	else
		return str
	end
end

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
					string.format("---@param %s %s\n", rewriteLuaReservedWords(param.identifier), param.type)
		else
			formatted_params = formatted_params .. (formatted_params:len() > 0 and ", " or "") ..
					string.format("%s %s", param.type, rewriteLuaReservedWords(param.identifier or ""))
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

---@param fncall string
---@return string
local function formatLuaFunctionCall(fncall)
	return fncall:reverse():gsub("%)[^%(]*%(", ""):gsub(" .*$", ""):reverse()
end

---@param def ReaScriptUSDocML
---@return string
local function formatDefinition(def)
	if isSignaturesClass(def.signatures) and hasLuaProp(def.functioncall) then
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


---@param definitions ReaScriptUSDocML[]
local function formatDefinitions(definitions)
	---@type string[]
	local formattedDefinitions = {}
	for _, definition in pairs(definitions) do
		local formattedDefinition = formatDefinition(definition)
		if formattedDefinition ~= "" then
			formattedDefinitions[#formattedDefinitions + 1] = formattedDefinition
		end
	end
	return formattedDefinitions
end

---@param T string[]
local function concatenateTable(T)
	local ret_str = ""
	for idx, str in pairs(T) do
		ret_str = ret_str .. str .. (idx ~= #T and "\n" or "")
	end
	return ret_str
end

---@param definitions ReaScriptUSDocML[]
local function writeLuaTypes(definitions)
	local metaTag = "---@meta\nreaper = {}\ngfx = {}\n\n"
	local formattedDefinitions = formatDefinitions(definitions)
	return metaTag .. concatenateTable(formattedDefinitions)
end


---@param definitions ReaScriptUSDocML[]
local function main(definitions)
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

---@type ReaScriptUSDocML
local definitions = parser()
main(definitions)
