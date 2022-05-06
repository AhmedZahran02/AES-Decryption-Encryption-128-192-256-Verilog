module Rcon(i , word);
    input [3:0]i;
    output reg [31:0]word;
    always @(i)begin
    case(i)
        1 : word = 32'h01000000;
        2 : word = 32'h02000000;
        3 : word = 32'h04000000;
        4 : word = 32'h08000000;
        5 : word = 32'h10000000;
        6 : word = 32'h20000000;
        7 : word = 32'h40000000;
        8 : word = 32'h80000000;
        9 : word = 32'h1b000000;
        10: word = 32'h36000000;
    endcase
    end
endmodule