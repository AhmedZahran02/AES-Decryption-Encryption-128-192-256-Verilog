module MixColumns(inState,outState);
input [127:0] inState;
output reg [127:0] outState;
reg [7:0] state [3:0][3:0];
reg [7:0] C [3:0][3:0];

integer a=0;
integer b=0;
initial begin
for(a=0;a<=127;a=a+1)
begin
		#0.0001 outState[a]=0;
end
end

always @(*)
begin 
	state[3][3]=inState[127:120];
	state[2][3]=inState[119:112];
	state[1][3]=inState[111:104];
	state[0][3]=inState[103:96];
	state[3][2]=inState[95:88];
	state[2][2]=inState[87:80];
	state[1][2]=inState[79:72];
	state[0][2]=inState[71:64];
	state[3][1]=inState[63:56];
	state[2][1]=inState[55:48];
	state[1][1]=inState[47:40];
	state[0][1]=inState[39:32];
	state[3][0]=inState[31:24];
	state[2][0]=inState[23:16];
	state[1][0]=inState[15:8];
	state[0][0]=inState[7:0];
end

initial begin
#0.002 C[3][3]=2;
#0.002 C[3][2]=3;
#0.002 C[3][1]=1;
#0.002 C[3][0]=1;
#0.002 C[2][3]=1;
#0.002 C[2][2]=2;
#0.002 C[2][1]=3;
#0.002 C[2][0]=1;
#0.002 C[1][3]=1;
#0.002 C[1][2]=1;
#0.002 C[1][1]=2;
#0.002 C[1][0]=3;
#0.002 C[0][3]=3;
#0.002 C[0][2]=1;
#0.002 C[0][1]=1;
#0.002 C[0][0]=2;
end
integer i=0;
integer j=0;
integer k=0;
initial begin

#1 for(i=3;i>=0;i=i-1)
begin
	#1 for(j=3;j>=0;j=j-1)
	begin
		#1 for(k=3;k>=0;k=k-1)
		begin
			if(C[j][k]==1)
			begin
				#1 $display("true");
				#1 outState[8*j+32*i+7-:8]=outState[8*j+32*i+7-:8]^(state[k][i][7:0]);
			end
			else if(C[j][k]==2)
			begin
				#1 $display("true2");
				if(state[k][i][7]==1) begin
					#1 $display("true2 state[7]=1");
					#1 outState[8*j+32*i+7-:8]=outState[8*j+32*i+7-:8]^((state[k][i]<<1)^8'h1b);
					#1 $display("outState[%d:%d]=%b",8*j+32*i+7,8*j+32*i,outState[8*j+32*i+7-:8]);
				end
				else begin
					#1 $display("false2 state[7]=1");
					#1 outState[8*j+32*i+7-:8]=outState[8*j+32*i+7-:8]^(state[k][i]<<1);
					#1 $display("outState[%d:%d]=%b",8*j+32*i+7,8*j+32*i,outState[8*j+32*i+7-:8]);end
			end
			else if(C[j][k]==3)begin
				#1 $display("true3");
				if(state[k][i][7]==1)begin
				#1 $display("true3 state[7]=1");
					#1 outState[8*j+32*i+7-:8]=outState[8*j+32*i+7-:8]^(((state[k][i]<<1)^8'h1b)^state[k][i]);
					#1 $display("outState[%d:%d]=%b",8*j+32*i+7,8*j+32*i,outState[8*j+32*i+7-:8]);end
				else begin 
					#1 $display("false3 state[7]=1");
					#1 outState[8*j+32*i+7-:8]=outState[8*j+32*i+7-:8]^((state[k][i]<<1)^state[k][i]);
					#1 $display("outState[%d:%d]=%b",8*j+32*i+7,8*j+32*i,outState[8*j+32*i+7-:8]);end
			end
			else #1 $display("false");
			
			
		end
	end
end
end

endmodule