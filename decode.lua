local A_code = require "A_code"
local B_code = require "B_code"
local C_code = require "C_code"
local D_code = require "D_code"
local E_code = require "E_code"
local F_code = require "F_code"

function decode_func(code_str)
	local code = tonumber(code_str, 16)
	
	if(A_code.is(code)) then
		return A_code.decode(code)
	end
	
	if(B_code.is(code))then
		return B_code.decode(code)
	end
	
	if(C_code.is(code))then
	        return C_code.decode(code)
	end
	
	if(D_code.is(code))then
	        return D_code.decode(code)
	end
	
	if(E_code.is(code))then
	        return E_code.decode(code)
	end
	
	if(F_code.is(code))then
	        return F_code.decode(code)
	end

	return nil
end

return decode_func
