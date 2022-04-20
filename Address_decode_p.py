import math
#address bitness
addr_bitness = 16
#base bitness
base_bitness = 4

#TODO: Convert to positional encoding to reduce transistors count and improve fault-tolerance

#output lines
output_lines = 2**addr_bitness


#registers count
count = int(math.ceil(float(addr_bitness)/base_bitness))
output_base = 2**base_bitness

print("Total delay " + str(count*2*output_base/4)+" ps")
print("Transistors count: " + str(8*2**(addr_bitness))+"\r\n")

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
