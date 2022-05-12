module AES2(output [127:0] dataout);

	wire [127:0] datain;
	wire [127:0] key;
	
	wire [127:0] r_out[0:9];
	
	wire [127:0] keyout[1:10];
	
	KeyExpansion m0(key,0001,keyout[1]);
	genvar i;
	generate
	for(i = 2; i < 11; i=i+1)
	begin : iter_i
	KeyExpansion m1(keyout[i-1],i,keyout[i]);
	end
	endgenerate
	
	
	  
endmodule
