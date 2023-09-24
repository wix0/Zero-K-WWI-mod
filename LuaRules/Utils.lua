local N = 32
local P = 2^N

function band(x, y)
    if not x or not y then
        return 0
    end
	if y == 0xff then return x % 0x100 end
	if y == 0xffff then return x % 0x10000 end
	if y == 0xffffffff then return x % 0x100000000 end
	
	x, y = x % P, y % P
	local r = 0
	local p = 1
	for i = 1, N do
		local a, b = x % 2, y % 2
		x, y = math.floor(x / 2), math.floor(y / 2)
		if a + b == 2 then
			r = r + p
		end
		p = 2 * p
	end
	return r
end

function TableToString(tbl)
	local str = "{"
	for i, v in pairs(tbl) do
		if type(i) == "number" then
			str = str .. "[" .. i .. "] = "
		else
			str = str .. [[["]]..i..[["] = ]]
		end
		
		if type(v) == "table" then
			str = str .. TableToString(v)
		elseif type(v) == "boolean" then
			str = str .. tostring(v) .. ";"
		elseif type(v) == "string" then
			str = str .. "[[" .. v .. "]];"
		else
			str = str .. v .. ";"
		end
	end
	str = str .. "};"
	return str
end