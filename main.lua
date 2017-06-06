local decode = require "decode"
local ajuster = require "ajuster"

local mem013 = require "memmap.013"

ajuster.set_addr_map(mem013)

local file_name = arg[1]

local infile = io.open(file_name, "r")

local line

local one_op

for line in infile:lines()
do
	repeat
	line = string.match(line, "%S+")
	one_op = decode(line)
	if(nil == one_op) then
		print("bad code:", line)
		break
	end

	ajuster.ajust(one_op)
	print(one_op.op, one_op.arg1, one_op.arg2)
	until true
	
end


infile:close()
