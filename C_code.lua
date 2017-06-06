local code_mask = 0xFF00
local arg1_mask = 0x0080
local arg2_mask = 0x007F

local _M = {}
local bit = require "bit"

_M.map = {
        [0x1100] = "MOVF",
        [0x1400] = "RLF",
        [0x1500] = "RRF",
        [0x1700] = "SWAPF",
        [0x1300] = "INCF",
        [0x1600] = "INCFSZ",
        [0x1a00] = "DECF",
        [0x1200] = "DECFSZ",
        [0x1e00] = "ADDWF",
        [0x0600] = "ADCWF",
        [0x1b00] = "SUBWF",
        [0x0700] = "SBCWF",
        [0x1c00] = "ANDWF",
        [0x1d00] = "IORWF",
        [0x1f00] = "XORWF",
        [0x1000] = "COMF"
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
		local arg1 = bit.band(code, arg1_mask)
		local arg2 = bit.band(code, arg2_mask)
		if(arg1 ~= 0) then
			arg1 = 1
		end
		local code_str = string.format("%s\t0x%s,\t%d", _M.map[m_code], bit.tohex(arg2,4), arg1)
		return code_str
	end
	
	return nil
end


return _M
