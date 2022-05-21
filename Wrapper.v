module Wrapper(output reg led128,output reg led192,output reg led256,output reg led128inv,output reg led192inv,output reg led256inv);

wire [127:0] datain= 128'h00112233445566778899aabbccddeeff;

reg[127:0] key128=128'h000102030405060708090a0b0c0d0e0f;
reg [127:0] dataout128c= 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
wire [127:0] dataout128;
AES A1(dataout128,datain,key128);

always @(*)
begin
if(dataout128==dataout128c)
begin
led128=1;
end
else
begin
led128=0;
end
end

reg[191:0] key192=192'h000102030405060708090a0b0c0d0e0f1011121314151617;
reg [127:0] dataout192c= 128'hdda97ca4864cdfe06eaf70a0ec0d7191;
wire [127:0] dataout192;
AES A2(dataout192,datain,key128);

always @(*)
begin
if(dataout192==dataout192c)
begin
led192=1;
end
else
begin
led192=0;
end
end

reg[255:0] key256=256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
reg [127:0] dataout256c= 128'h8ea2b7ca516745bfeafc49904b496089;
wire [127:0] dataout256;
AES A3(dataout256,datain,key128);

always @(*)
begin
if(dataout256==dataout256c)
begin
led256=1;
end
else
begin
led256=0;
end
end
//------------------------------------------------

reg [127:0] dataoutci= 128'h00112233445566778899aabbccddeeff;

wire [127:0] datain128i= 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
wire [127:0] dataout128i;
AES2 A4(dataout128i,datain128i,key128);

always @(*)
begin
if(dataout128i==dataoutci)
begin
led128inv=1;
end
else
begin
led128inv=0;
end
end

wire [127:0] datain192i= 128'hdda97ca4864cdfe06eaf70a0ec0d7191;
wire [127:0] dataout192i;
AES2 A5(dataout192i,datain192i,key128);

always @(*)
begin
if(dataout192i==dataoutci)
begin
led192inv=1;
end
else
begin
led192inv=0;
end
end

wire [127:0] datain256i= 128'h8ea2b7ca516745bfeafc49904b496089;
wire [127:0] dataout256i;
AES2 A6(dataout256i,datain256i,key128);

always @(*)
begin
if(dataout256i==dataoutci)
begin
led256inv=1;
end
else
begin
led256inv=0;
end
end
endmodule
