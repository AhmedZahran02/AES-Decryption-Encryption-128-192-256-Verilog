module keys_192(
input [191:0]key,
output [2303:576]out
);

assign out[2303:2112]=key;
genvar i;
	generate
	for(i = 1; i <= 8; i=i+1)
	begin : iter_i
	KeyExpansion192 m0(out[(192*(13-i)-1)-:192],i,out[(192*(12-i)-1)-:192]);
	end
	endgenerate

endmodule