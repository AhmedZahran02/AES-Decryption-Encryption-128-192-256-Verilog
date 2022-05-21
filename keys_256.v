module keys_256(
input [255:0]key,
output [2047:0]out
);

assign out[2047:1792]=key;
genvar i;
	generate
	for(i = 1; i <= 7; i=i+1)
	begin : iter_i
	KeyExpansion256 m0(out[(256*(9-i)-1)-:256],i,out[(256*(8-i)-1)-:256]);
	end
	endgenerate

endmodule