module AES(
input [127:0]in,
output [127:0]out
);
wire [127:0]key=128'ha0fafe1788542cb123a339392a6c7605;
wire [127:0]nkey;
wire [127:0]bout;
    //test input 3243f6a8885a308d313198a2e0370734
    wire [127:0] state [4:0];
    assign state[0] = in;
integer i=0;

    subBytes m0(state[0],state[1]);
    Shift_Rows m1(state[2],state[1]);//reversed inputs
    MixColumns m2(state[2],state[3]);
//	KeyExpansion m3(key,i,nkey);
	 AddRoundKey m4(state[3],key,bout);

assign out = bout;
endmodule