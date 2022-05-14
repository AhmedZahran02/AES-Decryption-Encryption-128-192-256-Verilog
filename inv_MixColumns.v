module inv_MixColumns(in,out);
input [127:0] in;
output reg [127:0] out;
reg [7:0] state [3:0][3:0];
reg [7:0] catch;
reg [7:0] temp [3:0][3:0];
reg [7:0]inArr[15:0];
reg [7:0]outArr[15:0];
wire [7:0] mixer [3:0][3:0];
reg [7:0] hhh [3:0];
reg [7:0] hhh1;
reg [7:0] hhh2;
reg [7:0] hhh3;
reg [7:0] hhh4;

assign mixer [0][0] = 8'h0e;assign mixer [0][1] = 8'h09;assign mixer [0][2] = 8'h0d;assign mixer [0][3] = 8'h0b;
assign mixer [1][0] = 8'h0b;assign mixer [1][1] = 8'h0e;assign mixer [1][2] = 8'h09;assign mixer [1][3] = 8'h0d;
assign mixer [2][0] = 8'h0d;assign mixer [2][1] = 8'h0b;assign mixer [2][2] = 8'h0e;assign mixer [2][3] = 8'h09;
assign mixer [3][0] = 8'h09;assign mixer [3][1] = 8'h0d;assign mixer [3][2] = 8'h0b;assign mixer [3][3] = 8'h0e;

integer i,j;
integer k,l1,l2,l3,l4,l5,l6;
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
        if(mixer [k][i]== 8'h0b) begin
				hhh1 = state[i][j];
				catch = hhh1;
				for(l1=0;l1<3;l1=l1+1) begin
					if(catch[7]==0)begin
						hhh1 = hhh1<<1;
					end
					else begin
						hhh1 = hhh1<<1;
						hhh1 = hhh1 ^ 8'h1b;
					end
					catch = hhh1;
				end
            hhh[i] = state[i][j];
				catch = hhh[i];												
				if(catch[7]==0) begin
					hhh[i] = hhh[i]<<1;
				end
				else begin
					hhh[i] = hhh[i]<<1;
					hhh[i] = hhh[i] ^ 8'h1b;
				end
				hhh1 = hhh1 ^ hhh[i];
				hhh[i]=state[i][j];
				hhh1=hhh1^hhh[i];
				hhh[i]=hhh1;
				
				
			end
        else if(mixer [k][i]==8'h0d)begin
				hhh2 = state[i][j];
            catch =hhh2;
				for(l2=0;l2<3;l2=l2+1)begin
					if(catch[7]==0)begin
						hhh2=hhh2<<1;
					end
					else begin
						hhh2=hhh2<<1;
						hhh2=hhh2^8'h1b;
					end
					catch=hhh2;
				end
				hhh[i]=state[i][j];
				catch=hhh[i];
				for(l5=0;l5<2;l5=l5+1)begin
					if(catch[7]==0)begin
						hhh[i]=hhh[i]<<1;
					end
					else begin
						hhh[i]=hhh[i]<<1;
						hhh[i]=hhh[i]^8'h1b;
					end
					catch=hhh[i];
				end
				hhh2=hhh2^hhh[i];
				hhh2=hhh2^state[i][j];
				hhh[i]=hhh2;
				
			end
        else if(mixer [k][i]==8'h09)begin
				hhh3 = state[i][j];
            catch =state[i][j];
				for(l3 = 0; l3 < 3; l3 = l3 + 1) begin
					if(catch[7]==0)begin
						hhh3 = hhh3<<1;
					end
					else begin
						hhh3 = hhh3<<1;
						hhh3 = hhh3 ^ 8'h1b;
					end
            //hhh[i] = state[i][j]<<1;
					//hhh[i] = hhh[i] ^ state[i][j];
					catch = hhh3;
            end
				hhh3=hhh3^state[i][j];
				hhh[i]=hhh3;
        end
		  else if(mixer[k][i]==8'h0e)begin
				hhh4=state[i][j];
				catch = hhh4;
				for(l4=0;l4<3;l4=l4+1)begin
					if(catch[7]==0)begin	
						hhh4=hhh4<<1;
					end
					else begin	
						hhh4=hhh4<<1;
						hhh4=hhh4^8'h1b;
					end
					catch=hhh4;
				end
				hhh[i]=state[i][j];
				catch=hhh[i];
				for(l6=0;l6<2;l6=l6+1)begin					
					if(catch[7]==0)begin
						hhh[i] = hhh[i]<<1;
					end
					else begin
						hhh[i] = hhh[i]<<1;
						hhh[i] = hhh[i] ^ 8'h1b;
					end
					catch = hhh[i];
				end
				hhh4=hhh4^hhh[i];
				hhh[i]=state[i][j];
				catch=hhh[i];				
				if(catch[7]==0) begin
					hhh[i] = hhh[i]<<1;
				end
				else begin
					hhh[i] = hhh[i]<<1;
					hhh[i] = hhh[i] ^ 8'h1b;
				end
				hhh4=hhh4^hhh[i];
				hhh[i]=hhh4;
				
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