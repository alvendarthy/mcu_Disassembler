local _M = {}

local bit = require "bit"

local code_mask = 0xFC00
local arg1_mask = 0x0380
local arg2_mask = 0x007F

_M.map = {
	[0x3c00] = "BCF",
	[0x3800] = "BSF",
	[0x3400] = "BTFSC",
	[0x3000] = "BTFSS"
}

_M.is = function(code)
	local m_code = bit.band(code, code_mask)
	if(_M.map[m_code]) then
		return true
	end
	
	return false
end

_M.decode = function(code)
	if(_M.is(code))then
		local m_code = bit.band(code, code_mask)
		local arg1 = bit.rshift(bit.band(code, arg1_mask),7)
		local arg2 = bit.band(code, arg2_mask)
		return {["op"] = _M.map[m_code], ["arg1"] = arg2, ["arg2"] = arg1}
	end
	
	return nil
end

return _M
