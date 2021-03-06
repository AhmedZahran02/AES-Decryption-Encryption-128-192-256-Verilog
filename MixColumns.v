module MixColumns(in,out);
input [127:0] in;
output reg [127:0] out;
reg [7:0] state [3:0][3:0];
reg [7:0] catch;
reg [7:0] temp [3:0][3:0];
reg [7:0]inArr[15:0];
reg [7:0]outArr[15:0];
wire [7:0] mixer [3:0][3:0];
reg [7:0] hhh [3:0];

assign mixer [0][0] = 8'h02;assign mixer [0][1] = 8'h01;assign mixer [0][2] = 8'h01;assign mixer [0][3] = 8'h03;
assign mixer [1][0] = 8'h03;assign mixer [1][1] = 8'h02;assign mixer [1][2] = 8'h01;assign mixer [1][3] = 8'h01;
assign mixer [2][0] = 8'h01;assign mixer [2][1] = 8'h03;assign mixer [2][2] = 8'h02;assign mixer [2][3] = 8'h01;
assign mixer [3][0] = 8'h01;assign mixer [3][1] = 8'h01;assign mixer [3][2] = 8'h03;assign mixer [3][3] = 8'h02;

integer i,j;
integer k;
always @(*) begin
    for(j = 0; j < 16; j = j+1)begin
        inArr[j] = in[8*j+:8];
        end
        
    for(j = 0; j < 4; j = j+1)begin
       for(i = 0; i < 4; i = i+1)begin
          state[i][j] = inArr[i+4*j];
       end
    end
	 
  for( k=0; k<=3; k=k+1) begin
	for ( j=0; j<=3; j=j+1) begin
		for ( i=0; i<=3; i=i+1) begin 
        if(mixer [k][i]== 8'h01) begin
            hhh[i] = state[i][j];
				end
        else if(mixer [k][i]==8'h02)begin
            catch =state[i][j];
            if(catch[7]==0)begin
                hhh[i] = state[i][j]<<1;
            end
            else begin
            hhh[i] = state[i][j]<<1;
            hhh[i] = hhh[i] ^ 8'h1b;
            end
			end
        else if(mixer [k][i]==8'h03)begin
            catch =state[i][j];
            if(catch[7]==0)begin
                hhh[i] = state[i][j]<<1;
            end
            else begin
                hhh[i] = state[i][j]<<1;
                hhh[i] = hhh[i] ^ 8'h1b;
            end
            //hhh[i] = state[i][j]<<1;
            hhh[i] = hhh[i] ^ state[i][j];
            end
        end
            temp[k][j] = hhh[0]^hhh[1]^hhh[2]^hhh[3];
		end
	end
	
        for(j = 0; j < 4; j = j+1)begin
           for(i = 0; i < 4; i = i+1)begin
              outArr[i+4*j] = temp[i][j];
           end
        end
        
		for(j = 0; j < 16; j = j+1)begin
           out[8*j+:8] = outArr[j];
        end
end 
endmodule