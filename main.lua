local decode = require "decode"
local ajuster = require "ajuster"
local bit = require "bit"

local mem013 = require "memmap.013"

ajuster.set_addr_map(mem013)

local file_name = arg[1]

local infile = io.open(file_name, "r")

local line

local one_op

local rom = {}
local label_tab = {}
local func_tab = {}

local label_max = 0
local func_max = 0

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
	--print(one_op.op, one_op.arg1, one_op.arg2)
	if(one_op.op == "GOTO") then
		if(label_tab[one_op.arg1] == nil) then
			label_tab[one_op.arg1] = "LABEL_" .. label_max
			label_max = label_max + 1
		end
		one_op.arg1 = label_tab[one_op.arg1]
	end

	if(one_op.op == "CALL") then
		if(func_tab[one_op.arg1] == nil) then
                        func_tab[one_op.arg1] = "FUNC_" .. func_max
			func_max = func_max + 1
                end
                one_op.arg1 = func_tab[one_op.arg1]
	end
	table.insert(rom, one_op)
	until true
	
end

infile:close()

local line_num

for line_num, one_op in pairs(rom) do
	local str = one_op.op
	offset = line_num - 1
	repeat
	if(nil == one_op.arg1) then
		break
	end
	str = string.format("%-10s%4s%-10s", str, "", one_op.arg1)

	if(nil == one_op.arg2) then
                break
        end
	str = string.format("%-24s%-4s%-10s", str, ",", one_op.arg2)
	until true

	local label_id = label_tab[offset]
	if(label_id) then
		print("")
		print(label_id .. ":")
	end

	local func_id = func_tab[offset]
        if(func_id) then
		print("")
                print(func_id .. ":")
        end
	str = string.format("    %-38s    #0X%s", str, bit.tohex(offset,  4))
	print(str)
end
