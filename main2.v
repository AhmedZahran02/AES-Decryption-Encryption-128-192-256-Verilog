module main2(
input [127:0]in,
input [127:0]key,
output [127:0]out,
output [127:0]keyout,
);

wire [127:0] sb,sr,mcl,ark;
	 
	
inv_Shift_Rows m1(sr,in);//reversed inputs
invsubBytes m2(sr,sb);
assign ark=keyout^sb;
//inv_MixColumns m3(ark,mcl);

assign out = mcl;
endmodule
