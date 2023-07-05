---do not call with relative path, only full path
local function updateLuaPath()
	local currentDir = debug.getinfo(1, "S").source:sub(2):match("(.*[/\\])")
	package.path = package.path .. ";" .. currentDir .. "?.lua"
	print(package.path)
end

updateLuaPath()

local parser = require("parser")
local create_lua_types = require("create_lua_types")
---@type ReaScriptUSDocML
local definitions = parser.parse()
