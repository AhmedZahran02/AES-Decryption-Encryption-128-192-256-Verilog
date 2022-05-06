module AES(
input [127:0]in,
input [127:0] key,
output [127:0]out
);
reg [127:0]nkey;
reg [127:0]bout;
    //test input 3243f6a8885a308d313198a2e0370734
    wire [127:0] state [4:0];
    assign state[0] = in;
genvar i;
    generate
        for(i=0;i <= 3;i=i+1)begin:h
    subBytes m0(state[0],state[1]);
    Shift_Rows m1(state[2],state[1]);//reversed inputs
    MixColumns m2(state[2],state[3]);
	 KeyExpansion m3(key,i,nkey);
	 AddRoundKey m4(state[3],nkey,bout);
	end
endgenerate

assign out = bout;
endmodule