module address_decode_4_2
(
input wire[3:0] addr_raw,
input wire selector_enabled,
output wire[15:0] addr_selector
);

wire[4:0] r_0_addr;
wire[4:0] r_1_addr;

assign r_0_addr[0] = (addr_raw[1:0]==2'b00) ?1'b1:1'b0;
assign r_0_addr[1] = (addr_raw[1:0]==2'b01) ?1'b1:1'b0;
assign r_0_addr[2] = (addr_raw[1:0]==2'b10) ?1'b1:1'b0;
assign r_0_addr[3] = (addr_raw[1:0]==2'b11) ?1'b1:1'b0;
assign r_1_addr[0] = (addr_raw[3:2]==2'b00) ?1'b1:1'b0;
assign r_1_addr[1] = (addr_raw[3:2]==2'b01) ?1'b1:1'b0;
assign r_1_addr[2] = (addr_raw[3:2]==2'b10) ?1'b1:1'b0;
assign r_1_addr[3] = (addr_raw[3:2]==2'b11) ?1'b1:1'b0;

assign addr_selector = {r_1_addr[3]&r_0_addr[3]&selector_enabled,
r_1_addr[3]&r_0_addr[2]&selector_enabled,
r_1_addr[3]&r_0_addr[1]&selector_enabled,
r_1_addr[3]&r_0_addr[0]&selector_enabled,
r_1_addr[2]&r_0_addr[3]&selector_enabled,
r_1_addr[2]&r_0_addr[2]&selector_enabled,
r_1_addr[2]&r_0_addr[1]&selector_enabled,
r_1_addr[2]&r_0_addr[0]&selector_enabled,
r_1_addr[1]&r_0_addr[3]&selector_enabled,
r_1_addr[1]&r_0_addr[2]&selector_enabled,
r_1_addr[1]&r_0_addr[1]&selector_enabled,
r_1_addr[1]&r_0_addr[0]&selector_enabled,
r_1_addr[0]&r_0_addr[3]&selector_enabled,
r_1_addr[0]&r_0_addr[2]&selector_enabled,
r_1_addr[0]&r_0_addr[1]&selector_enabled,
r_1_addr[0]&r_0_addr[0]&selector_enabled};


endmodule
module memory_4
(input wire clk,
input wire write_en,
input wire[15:0] addr_selector_1,
input wire[15:0] addr_selector_2,
input wire[15:0] data_in,
output reg[15:0] data_out

);
reg[15:0] r_0_0;
reg[15:0] r_0_1;
reg[15:0] r_0_2;
reg[15:0] r_0_3;
reg[15:0] r_0_4;
reg[15:0] r_0_5;
reg[15:0] r_0_6;
reg[15:0] r_0_7;
reg[15:0] r_0_8;
reg[15:0] r_0_9;
reg[15:0] r_0_10;
reg[15:0] r_0_11;
reg[15:0] r_0_12;
reg[15:0] r_0_13;
reg[15:0] r_0_14;
reg[15:0] r_0_15;
reg[15:0] r_1_0;
reg[15:0] r_1_1;
reg[15:0] r_1_2;
reg[15:0] r_1_3;
reg[15:0] r_1_4;
reg[15:0] r_1_5;
reg[15:0] r_1_6;
reg[15:0] r_1_7;
reg[15:0] r_1_8;
reg[15:0] r_1_9;
reg[15:0] r_1_10;
reg[15:0] r_1_11;
reg[15:0] r_1_12;
reg[15:0] r_1_13;
reg[15:0] r_1_14;
reg[15:0] r_1_15;
reg[15:0] r_2_0;
reg[15:0] r_2_1;
reg[15:0] r_2_2;
reg[15:0] r_2_3;
reg[15:0] r_2_4;
reg[15:0] r_2_5;
reg[15:0] r_2_6;
reg[15:0] r_2_7;
reg[15:0] r_2_8;
reg[15:0] r_2_9;
reg[15:0] r_2_10;
reg[15:0] r_2_11;
reg[15:0] r_2_12;
reg[15:0] r_2_13;
reg[15:0] r_2_14;
reg[15:0] r_2_15;
reg[15:0] r_3_0;
reg[15:0] r_3_1;
reg[15:0] r_3_2;
reg[15:0] r_3_3;
reg[15:0] r_3_4;
reg[15:0] r_3_5;
reg[15:0] r_3_6;
reg[15:0] r_3_7;
reg[15:0] r_3_8;
reg[15:0] r_3_9;
reg[15:0] r_3_10;
reg[15:0] r_3_11;
reg[15:0] r_3_12;
reg[15:0] r_3_13;
reg[15:0] r_3_14;
reg[15:0] r_3_15;
reg[15:0] r_4_0;
reg[15:0] r_4_1;
reg[15:0] r_4_2;
reg[15:0] r_4_3;
reg[15:0] r_4_4;
reg[15:0] r_4_5;
reg[15:0] r_4_6;
reg[15:0] r_4_7;
reg[15:0] r_4_8;
reg[15:0] r_4_9;
reg[15:0] r_4_10;
reg[15:0] r_4_11;
reg[15:0] r_4_12;
reg[15:0] r_4_13;
reg[15:0] r_4_14;
reg[15:0] r_4_15;
reg[15:0] r_5_0;
reg[15:0] r_5_1;
reg[15:0] r_5_2;
reg[15:0] r_5_3;
reg[15:0] r_5_4;
reg[15:0] r_5_5;
reg[15:0] r_5_6;
reg[15:0] r_5_7;
reg[15:0] r_5_8;
reg[15:0] r_5_9;
reg[15:0] r_5_10;
reg[15:0] r_5_11;
reg[15:0] r_5_12;
reg[15:0] r_5_13;
reg[15:0] r_5_14;
reg[15:0] r_5_15;
reg[15:0] r_6_0;
reg[15:0] r_6_1;
reg[15:0] r_6_2;
reg[15:0] r_6_3;
reg[15:0] r_6_4;
reg[15:0] r_6_5;
reg[15:0] r_6_6;
reg[15:0] r_6_7;
reg[15:0] r_6_8;
reg[15:0] r_6_9;
reg[15:0] r_6_10;
reg[15:0] r_6_11;
reg[15:0] r_6_12;
reg[15:0] r_6_13;
reg[15:0] r_6_14;
reg[15:0] r_6_15;
reg[15:0] r_7_0;
reg[15:0] r_7_1;
reg[15:0] r_7_2;
reg[15:0] r_7_3;
reg[15:0] r_7_4;
reg[15:0] r_7_5;
reg[15:0] r_7_6;
reg[15:0] r_7_7;
reg[15:0] r_7_8;
reg[15:0] r_7_9;
reg[15:0] r_7_10;
reg[15:0] r_7_11;
reg[15:0] r_7_12;
reg[15:0] r_7_13;
reg[15:0] r_7_14;
reg[15:0] r_7_15;
reg[15:0] r_8_0;
reg[15:0] r_8_1;
reg[15:0] r_8_2;
reg[15:0] r_8_3;
reg[15:0] r_8_4;
reg[15:0] r_8_5;
reg[15:0] r_8_6;
reg[15:0] r_8_7;
reg[15:0] r_8_8;
reg[15:0] r_8_9;
reg[15:0] r_8_10;
reg[15:0] r_8_11;
reg[15:0] r_8_12;
reg[15:0] r_8_13;
reg[15:0] r_8_14;
reg[15:0] r_8_15;
reg[15:0] r_9_0;
reg[15:0] r_9_1;
reg[15:0] r_9_2;
reg[15:0] r_9_3;
reg[15:0] r_9_4;
reg[15:0] r_9_5;
reg[15:0] r_9_6;
reg[15:0] r_9_7;
reg[15:0] r_9_8;
reg[15:0] r_9_9;
reg[15:0] r_9_10;
reg[15:0] r_9_11;
reg[15:0] r_9_12;
reg[15:0] r_9_13;
reg[15:0] r_9_14;
reg[15:0] r_9_15;
reg[15:0] r_10_0;
reg[15:0] r_10_1;
reg[15:0] r_10_2;
reg[15:0] r_10_3;
reg[15:0] r_10_4;
reg[15:0] r_10_5;
reg[15:0] r_10_6;
reg[15:0] r_10_7;
reg[15:0] r_10_8;
reg[15:0] r_10_9;
reg[15:0] r_10_10;
reg[15:0] r_10_11;
reg[15:0] r_10_12;
reg[15:0] r_10_13;
reg[15:0] r_10_14;
reg[15:0] r_10_15;
reg[15:0] r_11_0;
reg[15:0] r_11_1;
reg[15:0] r_11_2;
reg[15:0] r_11_3;
reg[15:0] r_11_4;
reg[15:0] r_11_5;
reg[15:0] r_11_6;
reg[15:0] r_11_7;
reg[15:0] r_11_8;
reg[15:0] r_11_9;
reg[15:0] r_11_10;
reg[15:0] r_11_11;
reg[15:0] r_11_12;
reg[15:0] r_11_13;
reg[15:0] r_11_14;
reg[15:0] r_11_15;
reg[15:0] r_12_0;
reg[15:0] r_12_1;
reg[15:0] r_12_2;
reg[15:0] r_12_3;
reg[15:0] r_12_4;
reg[15:0] r_12_5;
reg[15:0] r_12_6;
reg[15:0] r_12_7;
reg[15:0] r_12_8;
reg[15:0] r_12_9;
reg[15:0] r_12_10;
reg[15:0] r_12_11;
reg[15:0] r_12_12;
reg[15:0] r_12_13;
reg[15:0] r_12_14;
reg[15:0] r_12_15;
reg[15:0] r_13_0;
reg[15:0] r_13_1;
reg[15:0] r_13_2;
reg[15:0] r_13_3;
reg[15:0] r_13_4;
reg[15:0] r_13_5;
reg[15:0] r_13_6;
reg[15:0] r_13_7;
reg[15:0] r_13_8;
reg[15:0] r_13_9;
reg[15:0] r_13_10;
reg[15:0] r_13_11;
reg[15:0] r_13_12;
reg[15:0] r_13_13;
reg[15:0] r_13_14;
reg[15:0] r_13_15;
reg[15:0] r_14_0;
reg[15:0] r_14_1;
reg[15:0] r_14_2;
reg[15:0] r_14_3;
reg[15:0] r_14_4;
reg[15:0] r_14_5;
reg[15:0] r_14_6;
reg[15:0] r_14_7;
reg[15:0] r_14_8;
reg[15:0] r_14_9;
reg[15:0] r_14_10;
reg[15:0] r_14_11;
reg[15:0] r_14_12;
reg[15:0] r_14_13;
reg[15:0] r_14_14;
reg[15:0] r_14_15;
reg[15:0] r_15_0;
reg[15:0] r_15_1;
reg[15:0] r_15_2;
reg[15:0] r_15_3;
reg[15:0] r_15_4;
reg[15:0] r_15_5;
reg[15:0] r_15_6;
reg[15:0] r_15_7;
reg[15:0] r_15_8;
reg[15:0] r_15_9;
reg[15:0] r_15_10;
reg[15:0] r_15_11;
reg[15:0] r_15_12;
reg[15:0] r_15_13;
reg[15:0] r_15_14;
reg[15:0] r_15_15;
always@(posedge clk)
begin

	if (addr_selector_1[0]&addr_selector_2[0])
		data_out <= r_0_0;
		if (write_en==1'b1)
			r_0_0 <= data_in;
	if (addr_selector_1[0]&addr_selector_2[1])
		data_out <= r_0_1;
		if (write_en==1'b1)
			r_0_1 <= data_in;
	if (addr_selector_1[0]&addr_selector_2[2])
		data_out <= r_0_2;
		if (write_en==1'b1)
			r_0_2 <= data_in;
	if (addr_selector_1[0]&addr_selector_2[3])
		data_out <= r_0_3;
		if (write_en==1'b1)
			r_0_3 <= data_in;
	if (addr_selector_1[0]&addr_selector_2[4])
		data_out <= r_0_4;
		if (write_en==1'b1)
			r_0_4 <= data_in;
	if (addr_selector_1[0]&addr_selector_2[5])
		data_out <= r_0_5;
		if (write_en==1'b1)
			r_0_5 <= data_in;
	if (addr_selector_1[0]&addr_selector_2[6])
		data_out <= r_0_6;
		if (write_en==1'b1)
			r_0_6 <= data_in;
	if (addr_selector_1[0]&addr_selector_2[7])
		data_out <= r_0_7;
		if (write_en==1'b1)
			r_0_7 <= data_in;
	if (addr_selector_1[0]&addr_selector_2[8])
		data_out <= r_0_8;
		if (write_en==1'b1)
			r_0_8 <= data_in;
	if (addr_selector_1[0]&addr_selector_2[9])
		data_out <= r_0_9;
		if (write_en==1'b1)
			r_0_9 <= data_in;
	if (addr_selector_1[0]&addr_selector_2[10])
		data_out <= r_0_10;
		if (write_en==1'b1)
			r_0_10 <= data_in;
	if (addr_selector_1[0]&addr_selector_2[11])
		data_out <= r_0_11;
		if (write_en==1'b1)
			r_0_11 <= data_in;
	if (addr_selector_1[0]&addr_selector_2[12])
		data_out <= r_0_12;
		if (write_en==1'b1)
			r_0_12 <= data_in;
	if (addr_selector_1[0]&addr_selector_2[13])
		data_out <= r_0_13;
		if (write_en==1'b1)
			r_0_13 <= data_in;
	if (addr_selector_1[0]&addr_selector_2[14])
		data_out <= r_0_14;
		if (write_en==1'b1)
			r_0_14 <= data_in;
	if (addr_selector_1[0]&addr_selector_2[15])
		data_out <= r_0_15;
		if (write_en==1'b1)
			r_0_15 <= data_in;
	if (addr_selector_1[1]&addr_selector_2[0])
		data_out <= r_1_0;
		if (write_en==1'b1)
			r_1_0 <= data_in;
	if (addr_selector_1[1]&addr_selector_2[1])
		data_out <= r_1_1;
		if (write_en==1'b1)
			r_1_1 <= data_in;
	if (addr_selector_1[1]&addr_selector_2[2])
		data_out <= r_1_2;
		if (write_en==1'b1)
			r_1_2 <= data_in;
	if (addr_selector_1[1]&addr_selector_2[3])
		data_out <= r_1_3;
		if (write_en==1'b1)
			r_1_3 <= data_in;
	if (addr_selector_1[1]&addr_selector_2[4])
		data_out <= r_1_4;
		if (write_en==1'b1)
			r_1_4 <= data_in;
	if (addr_selector_1[1]&addr_selector_2[5])
		data_out <= r_1_5;
		if (write_en==1'b1)
			r_1_5 <= data_in;
	if (addr_selector_1[1]&addr_selector_2[6])
		data_out <= r_1_6;
		if (write_en==1'b1)
			r_1_6 <= data_in;
	if (addr_selector_1[1]&addr_selector_2[7])
		data_out <= r_1_7;
		if (write_en==1'b1)
			r_1_7 <= data_in;
	if (addr_selector_1[1]&addr_selector_2[8])
		data_out <= r_1_8;
		if (write_en==1'b1)
			r_1_8 <= data_in;
	if (addr_selector_1[1]&addr_selector_2[9])
		data_out <= r_1_9;
		if (write_en==1'b1)
			r_1_9 <= data_in;
	if (addr_selector_1[1]&addr_selector_2[10])
		data_out <= r_1_10;
		if (write_en==1'b1)
			r_1_10 <= data_in;
	if (addr_selector_1[1]&addr_selector_2[11])
		data_out <= r_1_11;
		if (write_en==1'b1)
			r_1_11 <= data_in;
	if (addr_selector_1[1]&addr_selector_2[12])
		data_out <= r_1_12;
		if (write_en==1'b1)
			r_1_12 <= data_in;
	if (addr_selector_1[1]&addr_selector_2[13])
		data_out <= r_1_13;
		if (write_en==1'b1)
			r_1_13 <= data_in;
	if (addr_selector_1[1]&addr_selector_2[14])
		data_out <= r_1_14;
		if (write_en==1'b1)
			r_1_14 <= data_in;
	if (addr_selector_1[1]&addr_selector_2[15])
		data_out <= r_1_15;
		if (write_en==1'b1)
			r_1_15 <= data_in;
	if (addr_selector_1[2]&addr_selector_2[0])
		data_out <= r_2_0;
		if (write_en==1'b1)
			r_2_0 <= data_in;
	if (addr_selector_1[2]&addr_selector_2[1])
		data_out <= r_2_1;
		if (write_en==1'b1)
			r_2_1 <= data_in;
	if (addr_selector_1[2]&addr_selector_2[2])
		data_out <= r_2_2;
		if (write_en==1'b1)
			r_2_2 <= data_in;
	if (addr_selector_1[2]&addr_selector_2[3])
		data_out <= r_2_3;
		if (write_en==1'b1)
			r_2_3 <= data_in;
	if (addr_selector_1[2]&addr_selector_2[4])
		data_out <= r_2_4;
		if (write_en==1'b1)
			r_2_4 <= data_in;
	if (addr_selector_1[2]&addr_selector_2[5])
		data_out <= r_2_5;
		if (write_en==1'b1)
			r_2_5 <= data_in;
	if (addr_selector_1[2]&addr_selector_2[6])
		data_out <= r_2_6;
		if (write_en==1'b1)
			r_2_6 <= data_in;
	if (addr_selector_1[2]&addr_selector_2[7])
		data_out <= r_2_7;
		if (write_en==1'b1)
			r_2_7 <= data_in;
	if (addr_selector_1[2]&addr_selector_2[8])
		data_out <= r_2_8;
		if (write_en==1'b1)
			r_2_8 <= data_in;
	if (addr_selector_1[2]&addr_selector_2[9])
		data_out <= r_2_9;
		if (write_en==1'b1)
			r_2_9 <= data_in;
	if (addr_selector_1[2]&addr_selector_2[10])
		data_out <= r_2_10;
		if (write_en==1'b1)
			r_2_10 <= data_in;
	if (addr_selector_1[2]&addr_selector_2[11])
		data_out <= r_2_11;
		if (write_en==1'b1)
			r_2_11 <= data_in;
	if (addr_selector_1[2]&addr_selector_2[12])
		data_out <= r_2_12;
		if (write_en==1'b1)
			r_2_12 <= data_in;
	if (addr_selector_1[2]&addr_selector_2[13])
		data_out <= r_2_13;
		if (write_en==1'b1)
			r_2_13 <= data_in;
	if (addr_selector_1[2]&addr_selector_2[14])
		data_out <= r_2_14;
		if (write_en==1'b1)
			r_2_14 <= data_in;
	if (addr_selector_1[2]&addr_selector_2[15])
		data_out <= r_2_15;
		if (write_en==1'b1)
			r_2_15 <= data_in;
	if (addr_selector_1[3]&addr_selector_2[0])
		data_out <= r_3_0;
		if (write_en==1'b1)
			r_3_0 <= data_in;
	if (addr_selector_1[3]&addr_selector_2[1])
		data_out <= r_3_1;
		if (write_en==1'b1)
			r_3_1 <= data_in;
	if (addr_selector_1[3]&addr_selector_2[2])
		data_out <= r_3_2;
		if (write_en==1'b1)
			r_3_2 <= data_in;
	if (addr_selector_1[3]&addr_selector_2[3])
		data_out <= r_3_3;
		if (write_en==1'b1)
			r_3_3 <= data_in;
	if (addr_selector_1[3]&addr_selector_2[4])
		data_out <= r_3_4;
		if (write_en==1'b1)
			r_3_4 <= data_in;
	if (addr_selector_1[3]&addr_selector_2[5])
		data_out <= r_3_5;
		if (write_en==1'b1)
			r_3_5 <= data_in;
	if (addr_selector_1[3]&addr_selector_2[6])
		data_out <= r_3_6;
		if (write_en==1'b1)
			r_3_6 <= data_in;
	if (addr_selector_1[3]&addr_selector_2[7])
		data_out <= r_3_7;
		if (write_en==1'b1)
			r_3_7 <= data_in;
	if (addr_selector_1[3]&addr_selector_2[8])
		data_out <= r_3_8;
		if (write_en==1'b1)
			r_3_8 <= data_in;
	if (addr_selector_1[3]&addr_selector_2[9])
		data_out <= r_3_9;
		if (write_en==1'b1)
			r_3_9 <= data_in;
	if (addr_selector_1[3]&addr_selector_2[10])
		data_out <= r_3_10;
		if (write_en==1'b1)
			r_3_10 <= data_in;
	if (addr_selector_1[3]&addr_selector_2[11])
		data_out <= r_3_11;
		if (write_en==1'b1)
			r_3_11 <= data_in;
	if (addr_selector_1[3]&addr_selector_2[12])
		data_out <= r_3_12;
		if (write_en==1'b1)
			r_3_12 <= data_in;
	if (addr_selector_1[3]&addr_selector_2[13])
		data_out <= r_3_13;
		if (write_en==1'b1)
			r_3_13 <= data_in;
	if (addr_selector_1[3]&addr_selector_2[14])
		data_out <= r_3_14;
		if (write_en==1'b1)
			r_3_14 <= data_in;
	if (addr_selector_1[3]&addr_selector_2[15])
		data_out <= r_3_15;
		if (write_en==1'b1)
			r_3_15 <= data_in;
	if (addr_selector_1[4]&addr_selector_2[0])
		data_out <= r_4_0;
		if (write_en==1'b1)
			r_4_0 <= data_in;
	if (addr_selector_1[4]&addr_selector_2[1])
		data_out <= r_4_1;
		if (write_en==1'b1)
			r_4_1 <= data_in;
	if (addr_selector_1[4]&addr_selector_2[2])
		data_out <= r_4_2;
		if (write_en==1'b1)
			r_4_2 <= data_in;
	if (addr_selector_1[4]&addr_selector_2[3])
		data_out <= r_4_3;
		if (write_en==1'b1)
			r_4_3 <= data_in;
	if (addr_selector_1[4]&addr_selector_2[4])
		data_out <= r_4_4;
		if (write_en==1'b1)
			r_4_4 <= data_in;
	if (addr_selector_1[4]&addr_selector_2[5])
		data_out <= r_4_5;
		if (write_en==1'b1)
			r_4_5 <= data_in;
	if (addr_selector_1[4]&addr_selector_2[6])
		data_out <= r_4_6;
		if (write_en==1'b1)
			r_4_6 <= data_in;
	if (addr_selector_1[4]&addr_selector_2[7])
		data_out <= r_4_7;
		if (write_en==1'b1)
			r_4_7 <= data_in;
	if (addr_selector_1[4]&addr_selector_2[8])
		data_out <= r_4_8;
		if (write_en==1'b1)
			r_4_8 <= data_in;
	if (addr_selector_1[4]&addr_selector_2[9])
		data_out <= r_4_9;
		if (write_en==1'b1)
			r_4_9 <= data_in;
	if (addr_selector_1[4]&addr_selector_2[10])
		data_out <= r_4_10;
		if (write_en==1'b1)
			r_4_10 <= data_in;
	if (addr_selector_1[4]&addr_selector_2[11])
		data_out <= r_4_11;
		if (write_en==1'b1)
			r_4_11 <= data_in;
	if (addr_selector_1[4]&addr_selector_2[12])
		data_out <= r_4_12;
		if (write_en==1'b1)
			r_4_12 <= data_in;
	if (addr_selector_1[4]&addr_selector_2[13])
		data_out <= r_4_13;
		if (write_en==1'b1)
			r_4_13 <= data_in;
	if (addr_selector_1[4]&addr_selector_2[14])
		data_out <= r_4_14;
		if (write_en==1'b1)
			r_4_14 <= data_in;
	if (addr_selector_1[4]&addr_selector_2[15])
		data_out <= r_4_15;
		if (write_en==1'b1)
			r_4_15 <= data_in;
	if (addr_selector_1[5]&addr_selector_2[0])
		data_out <= r_5_0;
		if (write_en==1'b1)
			r_5_0 <= data_in;
	if (addr_selector_1[5]&addr_selector_2[1])
		data_out <= r_5_1;
		if (write_en==1'b1)
			r_5_1 <= data_in;
	if (addr_selector_1[5]&addr_selector_2[2])
		data_out <= r_5_2;
		if (write_en==1'b1)
			r_5_2 <= data_in;
	if (addr_selector_1[5]&addr_selector_2[3])
		data_out <= r_5_3;
		if (write_en==1'b1)
			r_5_3 <= data_in;
	if (addr_selector_1[5]&addr_selector_2[4])
		data_out <= r_5_4;
		if (write_en==1'b1)
			r_5_4 <= data_in;
	if (addr_selector_1[5]&addr_selector_2[5])
		data_out <= r_5_5;
		if (write_en==1'b1)
			r_5_5 <= data_in;
	if (addr_selector_1[5]&addr_selector_2[6])
		data_out <= r_5_6;
		if (write_en==1'b1)
			r_5_6 <= data_in;
	if (addr_selector_1[5]&addr_selector_2[7])
		data_out <= r_5_7;
		if (write_en==1'b1)
			r_5_7 <= data_in;
	if (addr_selector_1[5]&addr_selector_2[8])
		data_out <= r_5_8;
		if (write_en==1'b1)
			r_5_8 <= data_in;
	if (addr_selector_1[5]&addr_selector_2[9])
		data_out <= r_5_9;
		if (write_en==1'b1)
			r_5_9 <= data_in;
	if (addr_selector_1[5]&addr_selector_2[10])
		data_out <= r_5_10;
		if (write_en==1'b1)
			r_5_10 <= data_in;
	if (addr_selector_1[5]&addr_selector_2[11])
		data_out <= r_5_11;
		if (write_en==1'b1)
			r_5_11 <= data_in;
	if (addr_selector_1[5]&addr_selector_2[12])
		data_out <= r_5_12;
		if (write_en==1'b1)
			r_5_12 <= data_in;
	if (addr_selector_1[5]&addr_selector_2[13])
		data_out <= r_5_13;
		if (write_en==1'b1)
			r_5_13 <= data_in;
	if (addr_selector_1[5]&addr_selector_2[14])
		data_out <= r_5_14;
		if (write_en==1'b1)
			r_5_14 <= data_in;
	if (addr_selector_1[5]&addr_selector_2[15])
		data_out <= r_5_15;
		if (write_en==1'b1)
			r_5_15 <= data_in;
	if (addr_selector_1[6]&addr_selector_2[0])
		data_out <= r_6_0;
		if (write_en==1'b1)
			r_6_0 <= data_in;
	if (addr_selector_1[6]&addr_selector_2[1])
		data_out <= r_6_1;
		if (write_en==1'b1)
			r_6_1 <= data_in;
	if (addr_selector_1[6]&addr_selector_2[2])
		data_out <= r_6_2;
		if (write_en==1'b1)
			r_6_2 <= data_in;
	if (addr_selector_1[6]&addr_selector_2[3])
		data_out <= r_6_3;
		if (write_en==1'b1)
			r_6_3 <= data_in;
	if (addr_selector_1[6]&addr_selector_2[4])
		data_out <= r_6_4;
		if (write_en==1'b1)
			r_6_4 <= data_in;
	if (addr_selector_1[6]&addr_selector_2[5])
		data_out <= r_6_5;
		if (write_en==1'b1)
			r_6_5 <= data_in;
	if (addr_selector_1[6]&addr_selector_2[6])
		data_out <= r_6_6;
		if (write_en==1'b1)
			r_6_6 <= data_in;
	if (addr_selector_1[6]&addr_selector_2[7])
		data_out <= r_6_7;
		if (write_en==1'b1)
			r_6_7 <= data_in;
	if (addr_selector_1[6]&addr_selector_2[8])
		data_out <= r_6_8;
		if (write_en==1'b1)
			r_6_8 <= data_in;
	if (addr_selector_1[6]&addr_selector_2[9])
		data_out <= r_6_9;
		if (write_en==1'b1)
			r_6_9 <= data_in;
	if (addr_selector_1[6]&addr_selector_2[10])
		data_out <= r_6_10;
		if (write_en==1'b1)
			r_6_10 <= data_in;
	if (addr_selector_1[6]&addr_selector_2[11])
		data_out <= r_6_11;
		if (write_en==1'b1)
			r_6_11 <= data_in;
	if (addr_selector_1[6]&addr_selector_2[12])
		data_out <= r_6_12;
		if (write_en==1'b1)
			r_6_12 <= data_in;
	if (addr_selector_1[6]&addr_selector_2[13])
		data_out <= r_6_13;
		if (write_en==1'b1)
			r_6_13 <= data_in;
	if (addr_selector_1[6]&addr_selector_2[14])
		data_out <= r_6_14;
		if (write_en==1'b1)
			r_6_14 <= data_in;
	if (addr_selector_1[6]&addr_selector_2[15])
		data_out <= r_6_15;
		if (write_en==1'b1)
			r_6_15 <= data_in;
	if (addr_selector_1[7]&addr_selector_2[0])
		data_out <= r_7_0;
		if (write_en==1'b1)
			r_7_0 <= data_in;
	if (addr_selector_1[7]&addr_selector_2[1])
		data_out <= r_7_1;
		if (write_en==1'b1)
			r_7_1 <= data_in;
	if (addr_selector_1[7]&addr_selector_2[2])
		data_out <= r_7_2;
		if (write_en==1'b1)
			r_7_2 <= data_in;
	if (addr_selector_1[7]&addr_selector_2[3])
		data_out <= r_7_3;
		if (write_en==1'b1)
			r_7_3 <= data_in;
	if (addr_selector_1[7]&addr_selector_2[4])
		data_out <= r_7_4;
		if (write_en==1'b1)
			r_7_4 <= data_in;
	if (addr_selector_1[7]&addr_selector_2[5])
		data_out <= r_7_5;
		if (write_en==1'b1)
			r_7_5 <= data_in;
	if (addr_selector_1[7]&addr_selector_2[6])
		data_out <= r_7_6;
		if (write_en==1'b1)
			r_7_6 <= data_in;
	if (addr_selector_1[7]&addr_selector_2[7])
		data_out <= r_7_7;
		if (write_en==1'b1)
			r_7_7 <= data_in;
	if (addr_selector_1[7]&addr_selector_2[8])
		data_out <= r_7_8;
		if (write_en==1'b1)
			r_7_8 <= data_in;
	if (addr_selector_1[7]&addr_selector_2[9])
		data_out <= r_7_9;
		if (write_en==1'b1)
			r_7_9 <= data_in;
	if (addr_selector_1[7]&addr_selector_2[10])
		data_out <= r_7_10;
		if (write_en==1'b1)
			r_7_10 <= data_in;
	if (addr_selector_1[7]&addr_selector_2[11])
		data_out <= r_7_11;
		if (write_en==1'b1)
			r_7_11 <= data_in;
	if (addr_selector_1[7]&addr_selector_2[12])
		data_out <= r_7_12;
		if (write_en==1'b1)
			r_7_12 <= data_in;
	if (addr_selector_1[7]&addr_selector_2[13])
		data_out <= r_7_13;
		if (write_en==1'b1)
			r_7_13 <= data_in;
	if (addr_selector_1[7]&addr_selector_2[14])
		data_out <= r_7_14;
		if (write_en==1'b1)
			r_7_14 <= data_in;
	if (addr_selector_1[7]&addr_selector_2[15])
		data_out <= r_7_15;
		if (write_en==1'b1)
			r_7_15 <= data_in;
	if (addr_selector_1[8]&addr_selector_2[0])
		data_out <= r_8_0;
		if (write_en==1'b1)
			r_8_0 <= data_in;
	if (addr_selector_1[8]&addr_selector_2[1])
		data_out <= r_8_1;
		if (write_en==1'b1)
			r_8_1 <= data_in;
	if (addr_selector_1[8]&addr_selector_2[2])
		data_out <= r_8_2;
		if (write_en==1'b1)
			r_8_2 <= data_in;
	if (addr_selector_1[8]&addr_selector_2[3])
		data_out <= r_8_3;
		if (write_en==1'b1)
			r_8_3 <= data_in;
	if (addr_selector_1[8]&addr_selector_2[4])
		data_out <= r_8_4;
		if (write_en==1'b1)
			r_8_4 <= data_in;
	if (addr_selector_1[8]&addr_selector_2[5])
		data_out <= r_8_5;
		if (write_en==1'b1)
			r_8_5 <= data_in;
	if (addr_selector_1[8]&addr_selector_2[6])
		data_out <= r_8_6;
		if (write_en==1'b1)
			r_8_6 <= data_in;
	if (addr_selector_1[8]&addr_selector_2[7])
		data_out <= r_8_7;
		if (write_en==1'b1)
			r_8_7 <= data_in;
	if (addr_selector_1[8]&addr_selector_2[8])
		data_out <= r_8_8;
		if (write_en==1'b1)
			r_8_8 <= data_in;
	if (addr_selector_1[8]&addr_selector_2[9])
		data_out <= r_8_9;
		if (write_en==1'b1)
			r_8_9 <= data_in;
	if (addr_selector_1[8]&addr_selector_2[10])
		data_out <= r_8_10;
		if (write_en==1'b1)
			r_8_10 <= data_in;
	if (addr_selector_1[8]&addr_selector_2[11])
		data_out <= r_8_11;
		if (write_en==1'b1)
			r_8_11 <= data_in;
	if (addr_selector_1[8]&addr_selector_2[12])
		data_out <= r_8_12;
		if (write_en==1'b1)
			r_8_12 <= data_in;
	if (addr_selector_1[8]&addr_selector_2[13])
		data_out <= r_8_13;
		if (write_en==1'b1)
			r_8_13 <= data_in;
	if (addr_selector_1[8]&addr_selector_2[14])
		data_out <= r_8_14;
		if (write_en==1'b1)
			r_8_14 <= data_in;
	if (addr_selector_1[8]&addr_selector_2[15])
		data_out <= r_8_15;
		if (write_en==1'b1)
			r_8_15 <= data_in;
	if (addr_selector_1[9]&addr_selector_2[0])
		data_out <= r_9_0;
		if (write_en==1'b1)
			r_9_0 <= data_in;
	if (addr_selector_1[9]&addr_selector_2[1])
		data_out <= r_9_1;
		if (write_en==1'b1)
			r_9_1 <= data_in;
	if (addr_selector_1[9]&addr_selector_2[2])
		data_out <= r_9_2;
		if (write_en==1'b1)
			r_9_2 <= data_in;
	if (addr_selector_1[9]&addr_selector_2[3])
		data_out <= r_9_3;
		if (write_en==1'b1)
			r_9_3 <= data_in;
	if (addr_selector_1[9]&addr_selector_2[4])
		data_out <= r_9_4;
		if (write_en==1'b1)
			r_9_4 <= data_in;
	if (addr_selector_1[9]&addr_selector_2[5])
		data_out <= r_9_5;
		if (write_en==1'b1)
			r_9_5 <= data_in;
	if (addr_selector_1[9]&addr_selector_2[6])
		data_out <= r_9_6;
		if (write_en==1'b1)
			r_9_6 <= data_in;
	if (addr_selector_1[9]&addr_selector_2[7])
		data_out <= r_9_7;
		if (write_en==1'b1)
			r_9_7 <= data_in;
	if (addr_selector_1[9]&addr_selector_2[8])
		data_out <= r_9_8;
		if (write_en==1'b1)
			r_9_8 <= data_in;
	if (addr_selector_1[9]&addr_selector_2[9])
		data_out <= r_9_9;
		if (write_en==1'b1)
			r_9_9 <= data_in;
	if (addr_selector_1[9]&addr_selector_2[10])
		data_out <= r_9_10;
		if (write_en==1'b1)
			r_9_10 <= data_in;
	if (addr_selector_1[9]&addr_selector_2[11])
		data_out <= r_9_11;
		if (write_en==1'b1)
			r_9_11 <= data_in;
	if (addr_selector_1[9]&addr_selector_2[12])
		data_out <= r_9_12;
		if (write_en==1'b1)
			r_9_12 <= data_in;
	if (addr_selector_1[9]&addr_selector_2[13])
		data_out <= r_9_13;
		if (write_en==1'b1)
			r_9_13 <= data_in;
	if (addr_selector_1[9]&addr_selector_2[14])
		data_out <= r_9_14;
		if (write_en==1'b1)
			r_9_14 <= data_in;
	if (addr_selector_1[9]&addr_selector_2[15])
		data_out <= r_9_15;
		if (write_en==1'b1)
			r_9_15 <= data_in;
	if (addr_selector_1[10]&addr_selector_2[0])
		data_out <= r_10_0;
		if (write_en==1'b1)
			r_10_0 <= data_in;
	if (addr_selector_1[10]&addr_selector_2[1])
		data_out <= r_10_1;
		if (write_en==1'b1)
			r_10_1 <= data_in;
	if (addr_selector_1[10]&addr_selector_2[2])
		data_out <= r_10_2;
		if (write_en==1'b1)
			r_10_2 <= data_in;
	if (addr_selector_1[10]&addr_selector_2[3])
		data_out <= r_10_3;
		if (write_en==1'b1)
			r_10_3 <= data_in;
	if (addr_selector_1[10]&addr_selector_2[4])
		data_out <= r_10_4;
		if (write_en==1'b1)
			r_10_4 <= data_in;
	if (addr_selector_1[10]&addr_selector_2[5])
		data_out <= r_10_5;
		if (write_en==1'b1)
			r_10_5 <= data_in;
	if (addr_selector_1[10]&addr_selector_2[6])
		data_out <= r_10_6;
		if (write_en==1'b1)
			r_10_6 <= data_in;
	if (addr_selector_1[10]&addr_selector_2[7])
		data_out <= r_10_7;
		if (write_en==1'b1)
			r_10_7 <= data_in;
	if (addr_selector_1[10]&addr_selector_2[8])
		data_out <= r_10_8;
		if (write_en==1'b1)
			r_10_8 <= data_in;
	if (addr_selector_1[10]&addr_selector_2[9])
		data_out <= r_10_9;
		if (write_en==1'b1)
			r_10_9 <= data_in;
	if (addr_selector_1[10]&addr_selector_2[10])
		data_out <= r_10_10;
		if (write_en==1'b1)
			r_10_10 <= data_in;
	if (addr_selector_1[10]&addr_selector_2[11])
		data_out <= r_10_11;
		if (write_en==1'b1)
			r_10_11 <= data_in;
	if (addr_selector_1[10]&addr_selector_2[12])
		data_out <= r_10_12;
		if (write_en==1'b1)
			r_10_12 <= data_in;
	if (addr_selector_1[10]&addr_selector_2[13])
		data_out <= r_10_13;
		if (write_en==1'b1)
			r_10_13 <= data_in;
	if (addr_selector_1[10]&addr_selector_2[14])
		data_out <= r_10_14;
		if (write_en==1'b1)
			r_10_14 <= data_in;
	if (addr_selector_1[10]&addr_selector_2[15])
		data_out <= r_10_15;
		if (write_en==1'b1)
			r_10_15 <= data_in;
	if (addr_selector_1[11]&addr_selector_2[0])
		data_out <= r_11_0;
		if (write_en==1'b1)
			r_11_0 <= data_in;
	if (addr_selector_1[11]&addr_selector_2[1])
		data_out <= r_11_1;
		if (write_en==1'b1)
			r_11_1 <= data_in;
	if (addr_selector_1[11]&addr_selector_2[2])
		data_out <= r_11_2;
		if (write_en==1'b1)
			r_11_2 <= data_in;
	if (addr_selector_1[11]&addr_selector_2[3])
		data_out <= r_11_3;
		if (write_en==1'b1)
			r_11_3 <= data_in;
	if (addr_selector_1[11]&addr_selector_2[4])
		data_out <= r_11_4;
		if (write_en==1'b1)
			r_11_4 <= data_in;
	if (addr_selector_1[11]&addr_selector_2[5])
		data_out <= r_11_5;
		if (write_en==1'b1)
			r_11_5 <= data_in;
	if (addr_selector_1[11]&addr_selector_2[6])
		data_out <= r_11_6;
		if (write_en==1'b1)
			r_11_6 <= data_in;
	if (addr_selector_1[11]&addr_selector_2[7])
		data_out <= r_11_7;
		if (write_en==1'b1)
			r_11_7 <= data_in;
	if (addr_selector_1[11]&addr_selector_2[8])
		data_out <= r_11_8;
		if (write_en==1'b1)
			r_11_8 <= data_in;
	if (addr_selector_1[11]&addr_selector_2[9])
		data_out <= r_11_9;
		if (write_en==1'b1)
			r_11_9 <= data_in;
	if (addr_selector_1[11]&addr_selector_2[10])
		data_out <= r_11_10;
		if (write_en==1'b1)
			r_11_10 <= data_in;
	if (addr_selector_1[11]&addr_selector_2[11])
		data_out <= r_11_11;
		if (write_en==1'b1)
			r_11_11 <= data_in;
	if (addr_selector_1[11]&addr_selector_2[12])
		data_out <= r_11_12;
		if (write_en==1'b1)
			r_11_12 <= data_in;
	if (addr_selector_1[11]&addr_selector_2[13])
		data_out <= r_11_13;
		if (write_en==1'b1)
			r_11_13 <= data_in;
	if (addr_selector_1[11]&addr_selector_2[14])
		data_out <= r_11_14;
		if (write_en==1'b1)
			r_11_14 <= data_in;
	if (addr_selector_1[11]&addr_selector_2[15])
		data_out <= r_11_15;
		if (write_en==1'b1)
			r_11_15 <= data_in;
	if (addr_selector_1[12]&addr_selector_2[0])
		data_out <= r_12_0;
		if (write_en==1'b1)
			r_12_0 <= data_in;
	if (addr_selector_1[12]&addr_selector_2[1])
		data_out <= r_12_1;
		if (write_en==1'b1)
			r_12_1 <= data_in;
	if (addr_selector_1[12]&addr_selector_2[2])
		data_out <= r_12_2;
		if (write_en==1'b1)
			r_12_2 <= data_in;
	if (addr_selector_1[12]&addr_selector_2[3])
		data_out <= r_12_3;
		if (write_en==1'b1)
			r_12_3 <= data_in;
	if (addr_selector_1[12]&addr_selector_2[4])
		data_out <= r_12_4;
		if (write_en==1'b1)
			r_12_4 <= data_in;
	if (addr_selector_1[12]&addr_selector_2[5])
		data_out <= r_12_5;
		if (write_en==1'b1)
			r_12_5 <= data_in;
	if (addr_selector_1[12]&addr_selector_2[6])
		data_out <= r_12_6;
		if (write_en==1'b1)
			r_12_6 <= data_in;
	if (addr_selector_1[12]&addr_selector_2[7])
		data_out <= r_12_7;
		if (write_en==1'b1)
			r_12_7 <= data_in;
	if (addr_selector_1[12]&addr_selector_2[8])
		data_out <= r_12_8;
		if (write_en==1'b1)
			r_12_8 <= data_in;
	if (addr_selector_1[12]&addr_selector_2[9])
		data_out <= r_12_9;
		if (write_en==1'b1)
			r_12_9 <= data_in;
	if (addr_selector_1[12]&addr_selector_2[10])
		data_out <= r_12_10;
		if (write_en==1'b1)
			r_12_10 <= data_in;
	if (addr_selector_1[12]&addr_selector_2[11])
		data_out <= r_12_11;
		if (write_en==1'b1)
			r_12_11 <= data_in;
	if (addr_selector_1[12]&addr_selector_2[12])
		data_out <= r_12_12;
		if (write_en==1'b1)
			r_12_12 <= data_in;
	if (addr_selector_1[12]&addr_selector_2[13])
		data_out <= r_12_13;
		if (write_en==1'b1)
			r_12_13 <= data_in;
	if (addr_selector_1[12]&addr_selector_2[14])
		data_out <= r_12_14;
		if (write_en==1'b1)
			r_12_14 <= data_in;
	if (addr_selector_1[12]&addr_selector_2[15])
		data_out <= r_12_15;
		if (write_en==1'b1)
			r_12_15 <= data_in;
	if (addr_selector_1[13]&addr_selector_2[0])
		data_out <= r_13_0;
		if (write_en==1'b1)
			r_13_0 <= data_in;
	if (addr_selector_1[13]&addr_selector_2[1])
		data_out <= r_13_1;
		if (write_en==1'b1)
			r_13_1 <= data_in;
	if (addr_selector_1[13]&addr_selector_2[2])
		data_out <= r_13_2;
		if (write_en==1'b1)
			r_13_2 <= data_in;
	if (addr_selector_1[13]&addr_selector_2[3])
		data_out <= r_13_3;
		if (write_en==1'b1)
			r_13_3 <= data_in;
	if (addr_selector_1[13]&addr_selector_2[4])
		data_out <= r_13_4;
		if (write_en==1'b1)
			r_13_4 <= data_in;
	if (addr_selector_1[13]&addr_selector_2[5])
		data_out <= r_13_5;
		if (write_en==1'b1)
			r_13_5 <= data_in;
	if (addr_selector_1[13]&addr_selector_2[6])
		data_out <= r_13_6;
		if (write_en==1'b1)
			r_13_6 <= data_in;
	if (addr_selector_1[13]&addr_selector_2[7])
		data_out <= r_13_7;
		if (write_en==1'b1)
			r_13_7 <= data_in;
	if (addr_selector_1[13]&addr_selector_2[8])
		data_out <= r_13_8;
		if (write_en==1'b1)
			r_13_8 <= data_in;
	if (addr_selector_1[13]&addr_selector_2[9])
		data_out <= r_13_9;
		if (write_en==1'b1)
			r_13_9 <= data_in;
	if (addr_selector_1[13]&addr_selector_2[10])
		data_out <= r_13_10;
		if (write_en==1'b1)
			r_13_10 <= data_in;
	if (addr_selector_1[13]&addr_selector_2[11])
		data_out <= r_13_11;
		if (write_en==1'b1)
			r_13_11 <= data_in;
	if (addr_selector_1[13]&addr_selector_2[12])
		data_out <= r_13_12;
		if (write_en==1'b1)
			r_13_12 <= data_in;
	if (addr_selector_1[13]&addr_selector_2[13])
		data_out <= r_13_13;
		if (write_en==1'b1)
			r_13_13 <= data_in;
	if (addr_selector_1[13]&addr_selector_2[14])
		data_out <= r_13_14;
		if (write_en==1'b1)
			r_13_14 <= data_in;
	if (addr_selector_1[13]&addr_selector_2[15])
		data_out <= r_13_15;
		if (write_en==1'b1)
			r_13_15 <= data_in;
	if (addr_selector_1[14]&addr_selector_2[0])
		data_out <= r_14_0;
		if (write_en==1'b1)
			r_14_0 <= data_in;
	if (addr_selector_1[14]&addr_selector_2[1])
		data_out <= r_14_1;
		if (write_en==1'b1)
			r_14_1 <= data_in;
	if (addr_selector_1[14]&addr_selector_2[2])
		data_out <= r_14_2;
		if (write_en==1'b1)
			r_14_2 <= data_in;
	if (addr_selector_1[14]&addr_selector_2[3])
		data_out <= r_14_3;
		if (write_en==1'b1)
			r_14_3 <= data_in;
	if (addr_selector_1[14]&addr_selector_2[4])
		data_out <= r_14_4;
		if (write_en==1'b1)
			r_14_4 <= data_in;
	if (addr_selector_1[14]&addr_selector_2[5])
		data_out <= r_14_5;
		if (write_en==1'b1)
			r_14_5 <= data_in;
	if (addr_selector_1[14]&addr_selector_2[6])
		data_out <= r_14_6;
		if (write_en==1'b1)
			r_14_6 <= data_in;
	if (addr_selector_1[14]&addr_selector_2[7])
		data_out <= r_14_7;
		if (write_en==1'b1)
			r_14_7 <= data_in;
	if (addr_selector_1[14]&addr_selector_2[8])
		data_out <= r_14_8;
		if (write_en==1'b1)
			r_14_8 <= data_in;
	if (addr_selector_1[14]&addr_selector_2[9])
		data_out <= r_14_9;
		if (write_en==1'b1)
			r_14_9 <= data_in;
	if (addr_selector_1[14]&addr_selector_2[10])
		data_out <= r_14_10;
		if (write_en==1'b1)
			r_14_10 <= data_in;
	if (addr_selector_1[14]&addr_selector_2[11])
		data_out <= r_14_11;
		if (write_en==1'b1)
			r_14_11 <= data_in;
	if (addr_selector_1[14]&addr_selector_2[12])
		data_out <= r_14_12;
		if (write_en==1'b1)
			r_14_12 <= data_in;
	if (addr_selector_1[14]&addr_selector_2[13])
		data_out <= r_14_13;
		if (write_en==1'b1)
			r_14_13 <= data_in;
	if (addr_selector_1[14]&addr_selector_2[14])
		data_out <= r_14_14;
		if (write_en==1'b1)
			r_14_14 <= data_in;
	if (addr_selector_1[14]&addr_selector_2[15])
		data_out <= r_14_15;
		if (write_en==1'b1)
			r_14_15 <= data_in;
	if (addr_selector_1[15]&addr_selector_2[0])
		data_out <= r_15_0;
		if (write_en==1'b1)
			r_15_0 <= data_in;
	if (addr_selector_1[15]&addr_selector_2[1])
		data_out <= r_15_1;
		if (write_en==1'b1)
			r_15_1 <= data_in;
	if (addr_selector_1[15]&addr_selector_2[2])
		data_out <= r_15_2;
		if (write_en==1'b1)
			r_15_2 <= data_in;
	if (addr_selector_1[15]&addr_selector_2[3])
		data_out <= r_15_3;
		if (write_en==1'b1)
			r_15_3 <= data_in;
	if (addr_selector_1[15]&addr_selector_2[4])
		data_out <= r_15_4;
		if (write_en==1'b1)
			r_15_4 <= data_in;
	if (addr_selector_1[15]&addr_selector_2[5])
		data_out <= r_15_5;
		if (write_en==1'b1)
			r_15_5 <= data_in;
	if (addr_selector_1[15]&addr_selector_2[6])
		data_out <= r_15_6;
		if (write_en==1'b1)
			r_15_6 <= data_in;
	if (addr_selector_1[15]&addr_selector_2[7])
		data_out <= r_15_7;
		if (write_en==1'b1)
			r_15_7 <= data_in;
	if (addr_selector_1[15]&addr_selector_2[8])
		data_out <= r_15_8;
		if (write_en==1'b1)
			r_15_8 <= data_in;
	if (addr_selector_1[15]&addr_selector_2[9])
		data_out <= r_15_9;
		if (write_en==1'b1)
			r_15_9 <= data_in;
	if (addr_selector_1[15]&addr_selector_2[10])
		data_out <= r_15_10;
		if (write_en==1'b1)
			r_15_10 <= data_in;
	if (addr_selector_1[15]&addr_selector_2[11])
		data_out <= r_15_11;
		if (write_en==1'b1)
			r_15_11 <= data_in;
	if (addr_selector_1[15]&addr_selector_2[12])
		data_out <= r_15_12;
		if (write_en==1'b1)
			r_15_12 <= data_in;
	if (addr_selector_1[15]&addr_selector_2[13])
		data_out <= r_15_13;
		if (write_en==1'b1)
			r_15_13 <= data_in;
	if (addr_selector_1[15]&addr_selector_2[14])
		data_out <= r_15_14;
		if (write_en==1'b1)
			r_15_14 <= data_in;
	if (addr_selector_1[15]&addr_selector_2[15])
		data_out <= r_15_15;
		if (write_en==1'b1)
			r_15_15 <= data_in;
end

endmodule
