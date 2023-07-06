---@generic T
---@generic U
---@param list T[]
---@param fn fun(acc: U, curVal: T): U
---@param init U?
---@return U
table.reduce = function(list, fn, init)
	local acc = init
	for k, v in ipairs(list) do
		if 1 == k and not init then
			acc = v
		else
			acc = fn(acc, v)
		end
	end
	return acc
end

---@generic T
---@param predicate fun(a: T): boolean
---@param t T[]
---@return T | nil
function table.find(t, predicate)
	for i, v in ipairs(t) do
		if predicate(v) then
			return v
		end
	end
	return nil
end

table.filter = function(t, filterIter)
	local out = {}

	for k, v in pairs(t) do
		if filterIter(v, k, t) then
			table.insert(out, v)
		end
	end

	return out
end


---@generic T
---@generic U
---@param tbl T[]
---@param fn fun(a: T): U
---@return U[]
table.map = function(tbl, fn)
	local result = {}
	for i, v in ipairs(tbl) do
		result[i] = fn(v)
	end
	return result
end
--[[ ---@param inputstr string
---@return string[]
string.split = function(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(t, str)
	end
	return t
end ]]

string.split = function(str, sep)
	local result = {}
	local regex = ("([^%s]+)"):format(sep)
	for each in str:gmatch(regex) do
		table.insert(result, each)
	end
	return result
end

---@param str string
---@return string
string.trim = function(str)
	return str:match "^%s*(.-)%s*$"
end

table.concatenate = function(t1, t2)
	for i = 1, #t2 do
		t1[#t1 + 1] = t2[i]
	end
	return t1
end

local helpers = {}

---@param a string
---@return ReturnValueElement
function helpers.map_FnArgsStr_to_RetValElement(a)
	local args = a:split("%s")
	local retval = {}
	---if #args>2, then it includes the `optional` keyword
	---eg. "optional boolean qnIn"
	if #args > 2 then
		local filtered_args = table.filter(args, function(e)
			return e ~= "optional"
		end)
		retval.type = filtered_args[1]
		retval.identifier = filtered_args[#filtered_args]
		retval.isOptional = true
	else
		retval.type = args[1]
		retval.identifier = args[2]
	end
	return retval
end

---@param return_val_string string
---@return ReturnValueElement[]
function helpers.get_retvals(return_val_string)
	local retvals = table.map(string.split(return_val_string, ","), function(str) return str:trim() end)
	local t = table.map(retvals, helpers.map_FnArgsStr_to_RetValElement)
	return t
end

---@param methodcall string
---@return ReturnValueElement[]
function helpers.get_fn_arguments(methodcall)
	local t = {}
	---remove name from signature
	---trim whitespace from arguments
	for k in methodcall:gmatch("%([^%)]*") do
		local s = k:sub(2):split(",")
		local u = table.map(s,
			---@param e string
			---@return string
			function(e) return e:trim() end)
		table.concatenate(t, u)
	end
	t = table.map(t, helpers.map_FnArgsStr_to_RetValElement)
	return t
end

-- printparse(methodcall)
return helpers
