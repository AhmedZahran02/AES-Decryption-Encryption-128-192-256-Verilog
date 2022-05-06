module rotword(
input [31:0]arin,
output [31:0]arout
);
reg [31:0]arbeforeout;

always @(*) begin
arbeforeout[7:0]=arin[31:24];
arbeforeout[15:8]=arin[7:0];
arbeforeout[23:16]=arin[15:8];
arbeforeout[31:24]=arin[23:16];
end
assign arout=arbeforeout;

endmodule
