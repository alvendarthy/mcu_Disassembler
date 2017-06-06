local _M = {}

local bit = require "bit"

local code_mask = 0xF800
local arg1_mask = 0x07FF

_M.map = {
        [0x2800] = "CALL",
        [0x2000] = "GOTO"
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
                return {["op"] = _M.map[m_code], ["arg1"] = arg1}
        end

        return nil
end

return _M
