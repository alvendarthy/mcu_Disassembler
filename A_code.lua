local _M  = {}


_M.map = {
	[0x0005] = "DAW",
	[0x0006] = "DSW",
	[0x1800] = "CLRW",
	[0x0001] = "RETFIE",
	[0x0002] = "RETURN",
	[0x0004] = "CLRWDT",
	[0x0003] = "SLEEP",
	[0x0000] = "NOP"
}

_M.is = function (code)
	if(_M.map[code] == nil)then
		return false
	else 
		return true
	end
end

_M.decode = function(code)
	if(_M.is(code))then
		return {["op"] = _M.map[code]}
	end

	return nil
end


return _M
