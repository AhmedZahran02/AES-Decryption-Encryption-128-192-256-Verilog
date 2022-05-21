module AES2
#(
	parameter Nk=8,
	parameter Nr=14
)
(output [127:0] dataout);

	wire [127:0] datain;
	wire [Nk*32:0] key;
	reg [127:0] state;
	wire [127:0] r_out[0:Nr-1];
	
	wire [127:0] keyout[1:Nr];
	wire [127:0] sb,sr;
	
		
		wire [1407:0] bigout;
		wire [1727:0] bigout2;
		wire [2047:0] bigout3;
	
	keys_128 m(key,bigout);
		keys_192 mn(key,bigout2);
		keys_256 mnn(key,bigout3);
	reg [127:0] initialKey;
	always @(*) begin
		if(Nk==4) begin
			initialKey=bigout[127:0];
		end
		else if (Nk==6) begin
			initialKey=bigout2[1727-(Nr)*128-:128];
		end
		else if (Nk==8) begin
			initialKey=bigout3[2047-(Nr)*128-:128];
		end
	end
	
	assign r_out[0] = datain^initialKey;
	
	//main2 m2(.in(r_out[0]),.key(keyout[9]),.out(r_out[1]));
	genvar ik;
	generate
	for(ik=Nr-1;ik>=1;ik=ik-1)
	begin : iter_i2
	if(Nk==4) begin
		main2 m3(.in(r_out[Nr-ik-1]),.key(bigout[1407-(ik)*128-:128]),.out(r_out[Nr-ik]));
	end
	else if (Nk==6) begin
		main2 m3(.in(r_out[Nr-ik-1]),.key(bigout2[1727-(ik)*128-:128]),.out(r_out[Nr-ik]));
	end
	else if (Nk==8) begin
		main2 m3(.in(r_out[Nr-ik-1]),.key(bigout3[2047-(ik)*128-:128]),.out(r_out[Nr-ik]));
	end
	end
	endgenerate
	inv_Shift_Rows t3(sr, r_out[Nr-1]);
	invsubBytes t4(sr,sb);
	reg [127:0] finalKey;
	always @(*) begin
		if(Nk==4) begin
			finalKey=bigout[1407-:128];
		end
		else if (Nk==6) begin
			finalKey=bigout2[1727-:128];
		end
		else if (Nk==8) begin
			finalKey=bigout3[2047-:128];
		end
	end
	assign dataout=finalKey^sb;
	//state=datain;
	//state=datain^keyout[10];
	
	  
endmodule
