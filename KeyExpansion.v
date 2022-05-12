module KeyExpansion(
input [127:0]key,
input [3:0] i,
output [127:0]out
);
wire [31:0]sb;
wire [31:0]rc;
wire [31:0]rw;
rotword rt(key[31:0],rw); 
subBytes m0(rw,sb);
Rcon m1(i,rc);

assign out[127:96]=sb^rc^key[127:96];
assign out[95:64]=key[95:64]^out[127:96];
assign out[63:32]=key[63:32]^out[95:64];
assign out[31:0]=key[31:0]^out[63:32];

endmodule
