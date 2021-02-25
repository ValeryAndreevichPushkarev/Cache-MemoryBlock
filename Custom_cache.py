import math
#address bitness (memory addr size = 2^(addr_bitness*2))
addr_bitness = 4
#base bitness
base_bitness = 2

#blocks count
blocks_count = 16
blocks_base_bitness = 4
blocks_bitness = int(math.log(blocks_count, 2))

#data bitness in custom memory module
data_bitness = 16

#output lines
output_lines = 2**addr_bitness

#registers count
count = int(math.ceil(float(addr_bitness)/base_bitness))

formatStr = '{:0'+str(base_bitness)+'b}'

header = """module address_decode_"""+str(addr_bitness)+"_"+str(base_bitness)+"""
("""
header = header +"""\r\ninput wire["""+ str(addr_bitness-1)+""":0] addr_raw,"""
header = header +"""\r\ninput wire selector_enabled,"""
header = header + """\r\noutput wire["""+ str(output_lines-1)+""":0] addr_selector\r\n"""

header = header + """);\r\n\r\n"""
for i in range(count):
	header = header + "wire["+str(2**base_bitness)+":0] r_"+str(i)+"_addr;\r\n"
for i in range(count):
	for j in range(2**base_bitness):
			header = header + """
assign r_"""+str(i)+"""_addr["""+str(j)+"""] = (addr_raw["""+str(base_bitness*(i+1)-1)+""":"""+str(base_bitness*i)+"""]=="""+str(base_bitness)+"""'b"""+formatStr.format(j)+""") ?1'b1:1'b0;"""

header = header + "\r\n\r\n"
#decode address
header = header + "assign addr_selector = {"

for j in reversed(range(output_lines)):
	for i in reversed(range(count)):
		addr = j
		for l in range(i):
			addr = addr/(2**base_bitness)
		addr = addr % (2**base_bitness)
		header = header + "r_"+str(i)+"_addr["+str(addr)+"]"
		if (i!=0):
			header =header + "&"
		else:
			if (j!=0):
				header = header + "&selector_enabled,\r\n"
			else:
				header = header + "&selector_enabled};\r\n\r\n"

header = header + "\r\nendmodule\r\n"
with open('output.txt', 'w') as file:
	file.write(header)

header = ""
# write memory block with specified selectors
header = header + """module memory_"""+str(addr_bitness)+"""
("""
header = header + """input wire clk,\r\n"""
header = header + """input wire write_en,\r\n"""
header = header + """input wire["""+ str(output_lines-1)+""":0] addr_selector_1,\r\n"""
header = header + """input wire["""+ str(output_lines-1)+""":0] addr_selector_2,\r\n"""

header = header + """input wire["""+ str(data_bitness-1)+""":0] data_in,\r\n"""
header = header + """output reg["""+ str(data_bitness-1)+""":0] data_out\r\n
);\r\n"""

#write registers
for i in range(output_lines):
	for j in range(output_lines):
		header = header + "reg["+str(data_bitness-1)+":0] r_"+str(i)+"_"+str(j)+";\r\n"

#write registers access
header = header + """always@(posedge clk)
begin
"""
for i in range(output_lines):
	for j in range(output_lines):
		header = header + """
	if (addr_selector_1["""+str(i)+"]&addr_selector_2["+str(j)+"""])
	begin
		data_out <= r_"""+str(i)+"_"+str(j)+""";
		if (write_en==1'b1)
			r_"""+str(i)+"_"+str(j)+""" <= data_in;
	end"""

header = header + """\r\nend\r\n"""
header = header + "\r\nendmodule\r\n"

block_address_count = blocks_bitness/ blocks_base_bitness;
#write decoder for block address
header = header+ """module block_address_decode_"""+str(blocks_bitness)+"""
("""
header = header +"""\r\ninput wire["""+ str(blocks_bitness-1)+""":0] addr_raw,"""
header = header + """\r\noutput wire["""+ str(blocks_count-1)+""":0] addr_selector\r\n"""

header = header + """);\r\n\r\n"""
for i in range(block_address_count):
	header = header + "wire["+str(2**blocks_base_bitness)+":0] r_"+str(i)+"_addr;\r\n"
for i in range(block_address_count):
	for j in range(2**blocks_base_bitness):
			header = header + """
assign r_"""+str(i)+"""_addr["""+str(j)+"""] = (addr_raw["""+str(blocks_base_bitness*(i+1)-1)+""":"""+str(blocks_base_bitness*i)+"""]=="""+str(blocks_base_bitness)+"""'b"""+formatStr.format(j)+""") ?1'b1:1'b0;"""

header = header + "\r\n\r\n"
#decode address
header = header + "assign addr_selector = {"

for j in reversed(range(blocks_count)):
	for i in reversed(range(block_address_count)):
		addr = j
		for l in range(i):
			addr = addr/(2**blocks_base_bitness)
		addr = addr % (2**blocks_base_bitness)
		header = header + "r_"+str(i)+"_addr["+str(addr)+"]"
		if (i!=0):
			header =header + "&"
		else:
			if (j!=0):
				header = header + ",\r\n"
			else:
				header = header + "};\r\n\r\n"

header = header + "\r\nendmodule\r\n"

# write memory block with specified selectors
header = header + """module memory_bulk_"""+str(addr_bitness)+"""
("""
header = header + """input wire clk,\r\n"""
header = header + """input wire write_en,\r\n"""
header = header + """input wire["""+ str(blocks_bitness+2*addr_bitness-1)+""":0] addr_selector,\r\n"""
header = header + """input wire["""+ str(data_bitness-1)+""":0] data_in,\r\n"""
header = header + """output wire["""+ str(data_bitness-1)+""":0] data_out\r\n
);\r\n"""

#block address
header = header + "wire["+str(blocks_bitness-1)+":0] block_addr = addr_selector["+str(blocks_bitness+2*addr_bitness-1)+":"+str(2*addr_bitness-1)+"];\r\n"


header = header + "wire["+str(addr_bitness-1)+":0] addr_1 = addr_selector["+str(2*addr_bitness-1)+":"+str(addr_bitness)+"];\r\n"

header = header + "wire["+str(addr_bitness-1)+":0] addr_2 = addr_selector["+str(addr_bitness-1)+":0];\r\n\r\n"

header = header + "wire["+str(blocks_count-1)+":0] block_addr_sel;\r\n"

for j in range(blocks_count):
	header = header + "wire["+str(output_lines-1)+":0] addr_sel_1_"+str(j)+";\r\n"

header = header + "wire["+str(output_lines-1)+":0] addr_sel_2;\r\n\r\n"


header = header + "block_address_decode_"+str(blocks_bitness)+" block_addr_decode(block_addr, block_addr_sel);\r\n"

header = header + "address_decode_"+str(addr_bitness)+"_"+str(base_bitness)+"  column_addr_decode   (addr_2,1'b1,addr_sel_2);\r\n\r\n"


for j in range(blocks_count):
	header = header + "address_decode_"+str(addr_bitness)+"_"+str(base_bitness)+"  decod_"+str(j)+ " (addr_1,"
	header = header + "block_addr_sel["+str(j)+"]"
	header = header +",addr_sel_1_"+str(j)+");\r\n"
for j in range(blocks_count):
	header = header + "wire["""+ str(data_bitness-1)+""":0] data_out_"""+str(j)+""";\r\n"""

for i in range(blocks_count):
	header = header + "memory_"""+str(addr_bitness)+""" mem_"""+str(i)+" (clk, write_en,addr_sel_1_"+str(i)+",addr_sel_2, data_in, data_out_"+str(i)+");\r\n"

#form output register
header = header + "assign data_out = {"
for i in range(data_bitness):
	for j in range(blocks_count):
		header = header + "data_out_"+str(j)+"["+str(i)+"]"
		if ((j==blocks_count-1)&(i!=data_bitness-1)):
			header = header + ",\r\n"
		else:
			if (j!=blocks_count-1):
				header = header + "|"

header = header + "};\r\n"
header = header + "\r\nendmodule\r\n"

# Write the file out again
with open('output.txt', 'a') as file:
	file.write(header)
