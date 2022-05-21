module Keysof128(
input [127:0]key,
output [1407:0]out
);

assign out[1407:1280]=key;

genvar i;
	generate
	for(i = 1; i <= 10; i=i+1)
	begin : iter_i
	KeyExpansion128 m0(key[(128*(12-i)-1)-:128],i,out[(128*(11-i)-1)-:128]);
	end
	endgenerate

endmodule
