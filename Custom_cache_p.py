import math
#address bitness (memory addr size = 2^(addr_bitness*2))
addr_bitness = 8
#base bitness
base_bitness = 4

#blocks count
blocks_count = 16
blocks_base_bitness = 8
blocks_bitness = int(math.log(blocks_count, 2))

#data bitness in custom memory module
data_bitness = 8

#output lines
output_lines = 2**addr_bitness

#registers count
count = int(math.ceil(float(addr_bitness)/base_bitness))

formatStr = '{:0'+str(base_bitness)+'b}'


#output lines
output_lines = 2**addr_bitness


#registers count
output_base = 2**base_bitness

print("Total delay " + str(count*2*output_base/4)+" ps\r\n")
print("Transistors count: " + str(8*2*2**(addr_bitness))+"\r\n")
formatStr = '{:0'+str(base_bitness)+'b}'

#Generate BaseBitness Decoder

def GetSelector(j,prev_selectors):
    num = math.floor(j/output_base);
    return prev_selectors[num]



header = """module Positional_encoding_"""+str(addr_bitness)+"""_"""+str(base_bitness)+"""
("""
header = header +"""\r\n    input wire["""+str(addr_bitness-1)+""":0] addr_src,"""
header = header + """\r\n   output wire["""+ str((output_base)*count-1)+""":0] addr_positional"""
header = header + """
);\r\n\r\n"""

for i in reversed(range(count)):
    for j in range(2**base_bitness):
                header = header + """assign addr_positional["""+str((i+1)*(2**base_bitness)-j-1)+"""] = (addr_src["""+str(base_bitness*(i+1)-1)+""":"""+str(base_bitness*i)+"""]=="""+str(base_bitness)+"""'b"""+formatStr.format(2**base_bitness-j-1)+""") ?1'b1:1'b0;\r\n"""

header = header + "\r\n\r\n"

header = header + "\r\nendmodule\r\n"



header = header +"""module address_decode_"""+str(base_bitness)+"""
("""
header = header +"""\r\n    input wire selector_enabled,"""
header = header +"""\r\n    input wire["""+ str(2**base_bitness-1)+""":0] addr_raw,"""
header = header +"""\r\n    input wire["""+ str((output_base)*count-1)+""":0] addr_full,"""
header = header + """\r\n   output wire["""+ str(output_base-1)+""":0] addr_selector,"""
header = header +"""\r\n    output wire["""+ str((output_base)*count-1)+""":0] addr_remain\r\n"""
header = header + """);\r\n\r\n"""

header = header + """addr_remain = selector_enabled&addr_remain;"""
for j in range(2**base_bitness):
			header = header + """
assign addr_selector["""+str(j)+"""] = selector_enabled&addr_raw["""+str(2**base_bitness-j-1)+"""];"""

header = header + "\r\n\r\n"

header = header + "\r\nendmodule\r\n"


header = header + """module address_decode_"""+str(addr_bitness)+"_"+str(base_bitness)+"""
("""
header = header +"""\r\ninput wire["""+ str(addr_bitness-1)+""":0] addr_raw,"""
header = header +"""\r\ninput wire selector_enabled,"""
header = header + """\r\noutput wire["""+ str(output_lines-1)+""":0] addr_selector\r\n"""

header = header + """);\r\n\r\n"""
header = header + """wire["""+str((output_base)*count-1)+"""] addr_pos;\r\n"""
header = header + """Positional_encoding_"""+str(addr_bitness)+"""_"""+str(base_bitness)+""" pe Positional_encoding_"""+str(addr_bitness)+"""_"""+str(base_bitness)+"""(addr_raw, addr_pos);\r\n"""

prev_selectors =[]
selectors = []
for i in range(count):
    prev_selectors = selectors
    selectors = []
    for j in range(int(output_base**(i))):
            #TODO: make proper wiring
            selectors.append([str(i),str(j)])
            header = header + "wire["+str(output_base-1)+":0] addr_selector"+str(i)+"_"+str(j)+";\r\n"
            header = header + "wire["+ str(output_base-1)+":0] addr_remain"+str(i)+"_"+str(j)+";\r\n"
            
            header = header + "address_decode_"+str(base_bitness)+" decoder_"+str(i)+"_"+str(j)+" = address_decode_"+str(base_bitness)+"("
            
            #Selector_enabled
            if (i==0):
                header = header + "1'b1,"
            else:
                selector_name = GetSelector(j,prev_selectors)
                header = header + 'addr_selector'+selector_name[0]+"_"+selector_name[1] +"["+str(j%output_base)+"],"

            #Target address
            if (i==0):
                header = header + "addr_raw["""+ str(output_base*count-1)+""":"""+str(output_base*(count-1))+"""],"""
            else:
                selector_name = GetSelector(j,prev_selectors)
                header = header + 'addr_remain'+selector_name[0]+"_"+selector_name[1] +"["+str((count-i)*output_base-1)+":"+str((count-i-1)*output_base)+"],"
            
            #Remain address
            if (i==0):
                header = header + "addr_raw,"
            else:
                selector_name = GetSelector(j,prev_selectors)
                header = header + 'addr_remain'+selector_name[0]+"_"+selector_name[1] +','
            
            #addr_selector, remain
            header = header + "addr_selector"+str(i)+"_"+str(j)+","+"addr_remain"+str(i)+"_"+str(j)+");\r\n"
            
            
            #
            header = header + "\r\n\r\n"
            
            
header = header + "\r\n\r\n"
#decode address
header = header + "assign addr_selector = {"

for i in range(len(selectors)):
    selector_name = selectors[i]
    header = header + "addr_selector"+str(selector_name[0])+"_"+str(selector_name[1])
    if (i!=len(selectors)-1):
        header = header + ","
        
header = header + "};\r\n\r\n"
header = header + "\r\nendmodule\r\n"

# Write the file out again
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
	with open('output.txt', 'a') as file:
		file.write(header)
	header = ""
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
	with open('output.txt', 'a') as file:
		file.write(header)
	header = ""

header = header + """\r\nend\r\n"""
header = header + "\r\nendmodule\r\n"
with open('output.txt', 'a') as file:
	file.write(header)
header = ""

block_address_count = int( blocks_bitness/ blocks_base_bitness);
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
			with open('output.txt', 'a') as file:
				file.write(header)
				header = ""
header = header + "\r\n\r\n"
#decode address
header = header + "assign addr_selector = {"

for j in reversed(range(blocks_count)):
	for i in reversed(range(block_address_count)):
		addr = j
		for l in range(i):
			addr = addr/(2**blocks_base_bitness)
		addr = int(addr % (2**blocks_base_bitness))
		header = header + "r_"+str(i)+"_addr["+str(addr)+"]"
		if (i!=0):
			header =header + "&"
		else:
			if (j!=0):
				header = header + ",\r\n"
			else:
				header = header + "};\r\n\r\n"
	with open('output.txt', 'a') as file:
		file.write(header)
	header = ""

header = header + "\r\nendmodule\r\n"
with open('output.txt', 'a') as file:
	file.write(header)
header = ""

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
with open('output.txt', 'a') as file:
	file.write(header)
header = ""
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
		with open('output.txt', 'a') as file:
			file.write(header)
		header = ""

header = header + "};\r\n"
header = header + "\r\nendmodule\r\n"

# Write the file out again
with open('output.txt', 'a') as file:
	file.write(header)
