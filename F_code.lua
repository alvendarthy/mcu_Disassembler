local _M = {}

local bit = require "bit"

local code_mask = 0x1880
local arg1_mask = 0x007F

_M.map = {
        [0x1880] = "CLRF"
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
                local code_str = string.format("%s\t0x%d", _M.map[m_code], bit.tohex(arg1,4))
                return code_str
        end

        return nil
end

return _M
