module KeyExpansion192(
input [191:0]key,
input [3:0] i,
output [191:0]out
);
wire [31:0]sb;
wire [31:0]rc;
wire [31:0]rw;
rotword rt(key[31:0],rw); 
SubWord m0(rw,sb);
Rcon m1(i,rc);

assign out[191:160]=sb^rc^key[191:160];
assign out[159:128]=key[159:128]^out[191:160];
assign out[127:96]=key[127:96]^out[159:128];
assign out[95:64]=key[95:64]^out[127:96];
assign out[63:32]=key[63:32]^out[95:64];
assign out[31:0]=key[31:0]^out[63:32];

endmodule
