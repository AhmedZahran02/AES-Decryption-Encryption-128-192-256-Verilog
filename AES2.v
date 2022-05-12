module AES2(output [127:0] dataout);

	wire [127:0] datain;
	wire [127:0] key;
	reg [127:0] state;
	wire [127:0] r_out[0:10];
	
	wire [127:0] keyout[1:10];
	wire [127:0] sb,sr;
	
	KeyExpansion m0(key,0001,keyout[1]);
	genvar i;
	generate
	for(i = 2; i < 11; i=i+1)
	begin : iter_i
	KeyExpansion m1(keyout[i-1],i,keyout[i]);
	end
	endgenerate
	assign r_out[0]=datain;
	
	main2 m2(.in(r_out[0]),.key(key),.out(r_out[1]));
	genvar ik;
	generate
	for(ik=10;ik>=2;ik=ik-1)
	begin : iter_i2
	main2 m3(.in(r_out[11-ik]),.key(keyout[ik]),.out(r_out[12-ik]));
	end
	endgenerate
	inv_Shift_Rows t3(sr, r_out[10]);
	invsubBytes t4(sr,sb);
	assign dataout=keyout[1]^sb;
	//state=datain;
	//state=datain^keyout[10];
	
	  
endmodule
