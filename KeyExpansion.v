module KeyExpansion(
input [127:0]key,
input [3:0] i,
output [127:0]out
);
reg [31:0]sb;
reg [31:0]rc;
subByte m0(key[127:96]>>8,sb);
Rcon m1(i,rc);

assign out[31:0]=key[31:0]^key[63:32];
assign out[63:32]=key[63:32]^key[95:64];
assign out[95:63]=key[95:64]^key[127:96];
assign out[127:96]=key[127:96]^sb^rc;
 
endmodule
