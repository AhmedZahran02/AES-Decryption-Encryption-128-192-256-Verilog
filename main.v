module main(
input [127:0]in,
input [127:0]key,
output [127:0]out,
output [127:0]keyout,
input [3:0]i
);

wire [127:0] sb,sr,mcl;

//KeyExpansion128 m0(key,i,keyout);
//KeyExpansion192 m4(key,i,keyout);
subBytes m1(in,sb);
Shift_Rows m2(sr,sb);//reversed inputs
MixColumns m3(sr,mcl);
		 
assign out = keyout^mcl;
endmodule
