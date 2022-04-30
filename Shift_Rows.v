module Shift_Rows(output [127:0]arout,input [127:0]arin);

reg [7:0] ar2din [0:3] [0:3];
reg [7:0] ar2dout[0:3] [0:3];
reg [127:0]arbeforeout;

//1D TO 2D
integer i,j;
integer ij;

always @(*) begin
for ( j=0; j<=3; j=j+1) begin
    for ( i=0; i<=3; i=i+1) begin 
        ij =15-(i+(4*j)); //eq to get corresponding bit number : that num + 8bits
        ar2din[i][j]=arin[ij*8  +:  8];
    end	
 end       
end

//SHIFTING
always @(*) begin
	for ( j=0; j<=3; j=j+1) begin
		ar2dout[0][j] = ar2din[0][j];
	end
	
	ar2dout[1][0] = ar2din[1][1];
	ar2dout[1][1] = ar2din[1][2];
	ar2dout[1][2] = ar2din[1][3];
	ar2dout[1][3] = ar2din[1][0];
	
	ar2dout[2][0] = ar2din[2][2];
	ar2dout[2][1] = ar2din[2][3];
	ar2dout[2][2] = ar2din[2][0];
	ar2dout[2][3] = ar2din[2][1];
			
	ar2dout[3][0] = ar2din[3][3];
	ar2dout[3][1] = ar2din[3][0];
	ar2dout[3][2] = ar2din[3][1];
	ar2dout[3][3] = ar2din[3][2];
	
 end

 //2D TO 1D
integer i2,j2;
integer ij2;
always @(*) begin
	for ( j2=0; j2<=3; j2=j2+1) begin
		for ( i2=0; i2<=3; i2=i2+1) begin
			ij2 =15-(i2+4*j2);//eq to get corresponding bit number : that num + 8bits
			arbeforeout[ij2*8  +:  8]=ar2dout[i2][j2];
		end
	end
end

assign arout=arbeforeout;

endmodule
