module tb;
reg clk,rst,write,read;
reg [3:0]din;
wire [3:0]dout;
wire full,empty;
fifo dut(.clk(clk),.rst(rst),.write(write),.read(read),.din(din),.dout(dout),.full(full),.empty(empty));
always #5 clk=~clk;
initial begin
clk=0;rst=0;write=0;read=0;din=0;#10;
rst=1;#20;rst=0;#10
write=1;din=3'd7;#10;
write=0;#10;
write=1;din=3'd5;#10;
write=0;#10;
write=1;din=3'd4;#10;
write=0;#10;
read=1;#10;read=0;#10;
read=1;#10;read=0;#10;
read=1;#10;read=0;#10;
$finish;
end
endmodule
