
local _M = {}

local addr_map

function _M.ajust(code)
	if(code.arg1 and (
		string.find(code.op, "F$") 
		or string.find(code.op, "FSS$") 
		or string.find(code.op, "FSC$") 
		or string.find(code.op, "FSZ$"))) then
		code.arg1 = addr_map[code.arg1] or code.arg1
	end

	if(code.arg2 and code.op ~= "BCF" and code.op ~= "BSF")then
		if(code.arg2 == 1) then
			code.arg2 = "F"
		else
			code.arg2 = "W"
		end
	end
end

function _M.set_addr_map (map)
	addr_map = map
end


return _M
