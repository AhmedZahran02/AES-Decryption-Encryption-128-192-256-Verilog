module AddRoundKey(inState, w ,outState);


input [127:0] inState;
input [127:0] w;
output reg [127:0] outState;
//input 3243f6a8885a308d313198a2e0370734
//key   2b7e151628aed2a6abf7158809cf4f3c
integer i=0;
always@(*) begin
for (i=0;i<=127;i=i+1) begin
	 outState[i] = inState[i] ^ w[i];
	end
end

endmodule
