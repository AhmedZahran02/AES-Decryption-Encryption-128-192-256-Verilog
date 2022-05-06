module SubWord(data,sb);

input [31:0] data;
output [31:0] sb;
     
     sbox q0(.a(data[31:24]),.c(sb[31:24]) );
     sbox q1(.a(data[23:16]),.c(sb[23:16]) );
     sbox q2(.a(data[15:8]),.c(sb[15:8]) );
     sbox q3(.a(data[7:0]),.c(sb[7:0]) );
	  
endmodule