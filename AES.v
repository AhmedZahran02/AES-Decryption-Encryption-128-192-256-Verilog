module AES(output [127:0] dataout);

		wire [127:0] datain;
		wire [127:0] key;
		parameter [3:0]Nk=10;
		wire [127:0] r_out[0:9];
		
		wire [127:0] keyout[1:10];
		
		reg [2303:0] bigout;
	
//	Keysof128 m12(key,bigout);
//	
//	assign r_out[0] = datain^key;
//	wire [127:0] sb,sr;
//	
//	main r1(.i(4'b0001),.in(r_out[0]),.key(key),.keyout(keyout[1]),.out(r_out[1]));
//	
//	genvar i;
//	generate
//	for(i = 2; i < Nk; i=i+1)
//	begin : iter_i
//	main r2(.i(i),.in(r_out[i-1]),.key(keyout[i-1]),.keyout(keyout[i]),.out(r_out[i]));
//	end
//	endgenerate
//	
//	KeyExpansion192 t0(keyout[Nk-1],Nk,keyout[Nk]);
//	subBytes t1(r_out[Nk-1],sb);
//	Shift_Rows t2(sr,sb);//reversed inputs
//	AES2 ae(datain);
//	assign dataout= keyout[Nk]^sr;
      
endmodule
