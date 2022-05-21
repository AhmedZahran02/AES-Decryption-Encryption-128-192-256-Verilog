module AES
#(
	parameter [3:0]Nk=8,
	parameter [3:0]Nr=14
)
(output [127:0] dataout);

		wire [127:0] datain;
		wire [Nk*32-1:0] key;
		//parameter [3:0]Nk=10;
		wire [127:0] r_out[0:Nr-1];
		
		wire [127:0] keyout[1:Nr];
		
		wire [1407:0] bigout;
		wire [1727:0] bigout2;
		wire [2047:0] bigout3;
	
		keys_128 m(key,bigout);
		keys_192 mn(key,bigout2);
		keys_256 mnn(key,bigout3);
	
	reg [127:0] initialKey;
	always @(*) begin
		if(Nk==4) begin
			initialKey=bigout[1407-:128];
		end
		else if (Nk==6) begin
			initialKey=bigout2[1727-:128];
		end
		else if (Nk==8) begin
			initialKey=bigout3[2047-:128];
		end
	end
	
	//initial begin
	//	if(Nk==4) begin
			assign r_out[0] = datain^initialKey;    
	wire [127:0] sb,sr;
	
	//main r1(.i(4'b0001),.in(r_out[0]),.key(key),.keyout(keyout[1]),.out(r_out[1]));
	
	genvar i;
	generate
	for(i = 1; i < Nr; i=i+1)
	begin : iter_i
	if(Nk==4) begin
		main r2(.in(r_out[i-1]),.key(bigout[1407-(i)*128-:128]),.out(r_out[i]));
	end
	else if (Nk==6) begin
		main r3(.in(r_out[i-1]),.key(bigout2[1727-(i)*128-:128]),.out(r_out[i]));
	end
	else if (Nk==8) begin
		main r4(.in(r_out[i-1]),.key(bigout3[2047-(i)*128-:128]),.out(r_out[i]));
	end
	end
	endgenerate
	
	//KeyExpansion192 t0(keyout[Nk-1],Nk,keyout[Nk]);
	subBytes t1(r_out[Nr-1],sb);
	Shift_Rows t2(sr,sb);//reversed inputs
	AES2 ae(datain);
	
	reg [127:0] finalKey;
	always @(*) begin
		if(Nk==4) begin
			finalKey=bigout[1407-(Nr)*128-:128];
		end
		else if (Nk==6) begin
			finalKey=bigout2[1727-(Nr)*128-:128];
		end
		else if (Nk==8) begin
			finalKey=bigout3[2047-(Nr)*128-:128];
		end
	end
	
	assign dataout= finalKey^sr;
      
endmodule
