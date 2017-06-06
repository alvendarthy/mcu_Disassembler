local A_code = require "A_code"
local B_code = require "B_code"
local C_code = require "C_code"
local D_code = require "D_code"
local E_code = require "E_code"
local F_code = require "F_code"

local code_str = arg[1]
if nil == code_str then
	print("please imput a code!")
	return
end

local code = tonumber(code_str, 16)

if(A_code.is(code)) then
	print(A_code.decode(code))
	return
end

if(B_code.is(code))then
	print(B_code.decode(code))
	return
end

if(C_code.is(code))then
        print(C_code.decode(code))
        return
end

if(D_code.is(code))then
        print(D_code.decode(code))
        return
end

if(E_code.is(code))then
        print(E_code.decode(code))
        return
end

if(F_code.is(code))then
        print(F_code.decode(code))
        return
end
