module AES(output [127:0] dataout);

    wire [127:0] datain;
    wire [127:0] key;
    
    wire [127:0] r_out[0:9];
    
    wire [127:0] keyout[1:10];
	 
	 assign r_out[0] = datain^key;
	 wire [127:0] sb,sr;
	 
    main r1(.i(4'b0001),.in(r_out[0]),.key(key)      ,.keyout(keyout[1]),.out(r_out[1]));
	 
	 genvar i;
	 generate
	 for(i = 2; i < 10; i=i+1)
	 begin : iter_i
	 main r2(.i(4'b0010),.in(r_out[i-1]),.key(keyout[i-1]),.keyout(keyout[i]),.out(r_out[i]));
	 end
	 endgenerate
	 
	 KeyExpansion t0(key,10,keyout[10]);
	 
	subBytes t1(r_out[9],sb);
	Shift_Rows t2(sr,sb);//reversed inputs
	 
	assign dataout= keyout[10]^sr;
      
endmodule