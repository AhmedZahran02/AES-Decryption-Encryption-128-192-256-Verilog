module main2(
input [127:0]in,
input [127:0]key,
output [127:0]out,
output [127:0]keyout,
input [3:0]i
);

wire [127:0] sb,sr,mcl,ark;
	 
	
KeyExpansion m0(key,i,keyout);
inv_Shift_Rows m2(sr,in);//reversed inputs
invsubBytes m1(sr,sb);
ark=keyout^sb;
//inv_MixColumns m3(ark,mcl);

assign out = mcl;
endmodule
