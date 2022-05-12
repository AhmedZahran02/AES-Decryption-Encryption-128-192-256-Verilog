module AES2(output [127:0] dataout);

		wire [127:0] datain;
		wire [127:0] key;
		
		wire [127:0] r_out[0:9];
		
		wire [127:0] keyout[1:10];
	
	assign r_out[0] = datain^key;
	wire [127:0] sb,sr;
	
	main r1(.i(4'b1011),.in(r_out[0]),.key(key),.keyout(keyout[1]),.out(r_out[1]));
	
	genvar i;
	generate
	for(i = 10; i > 1; i=i-1)
	begin : iter_i
	main2 r2(.i(i),.in(r_out[i+1]),.key(keyout[i+1]),.keyout(keyout[i]),.out(r_out[i]));
	end
	endgenerate
	
	KeyExpansion t0(keyout[1],1,keyout[1]);
	inv_Shift_Rows t2(sr,r_out[1]);//reversed inputs
	invsubBytes t1(sr,sb);
	
	assign dataout= keyout[1]^sb;
      
endmodule
