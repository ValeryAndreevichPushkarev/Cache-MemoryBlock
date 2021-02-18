import math
#address bitness
addr_bitness = 12
#base bitness
base_bitness = 4

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
header = header + "addr_selector = {"

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

# Write the file out again
with open('output.txt', 'w') as file:
	file.write(header)
