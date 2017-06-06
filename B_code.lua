local _M = {}
local bit = require "bit"


code_mask = 0xFF00
arg1_mask = 0x00FF

_M.map = {
	[0x0100]="RETLW",
	[0x0400]="MOVLW",
	[0x0d00]="XORLW",
	[0x0f00]="IORLW",
	[0x0e00]="ANDLW",
	[0x0a00]="SUBLW",
	[0x0800]="ADDLW",
}

_M.is = function (code)
	local mcode = bit.band(code, code_mask)
	if(_M.map[mcode]) then
		return true
	end

	return false
end

_M.decode = function(code)
	if(_M.is(code))then
		local mcode = bit.band(code, code_mask)
		local arg1 = bit.band(code, arg1_mask)
		local code_str = string.format("%s\t%d", _M.map[mcode], arg1)
		return code_str
	end
	
	return nil
end


return _M
