module fifo(input clk,rst,write,read,[3:0]din,output reg [3:0]dout,output full,empty);
reg [3:0]fio[0:7];
reg [2:0]wr_ptr,wr_ptr_nxt,wr_ptr_incr;
reg [2:0]rd_ptr,rd_ptr_nxt,rd_ptr_incr;
reg fifo_full_reg,full_nxt;
reg fifo_empty_reg,empty_nxt;
wire wr_en;
assign wr_en=(write & ~fifo_full_reg);
assign full=fifo_full_reg;
assign empty=fifo_empty_reg;
always @(posedge clk)begin
if(wr_en)begin
fio[wr_ptr]<=din;
end
else
dout=fio[rd_ptr];
end
always @(posedge clk)begin
if(rst)
begin
wr_ptr<=0;
rd_ptr<=0;fifo_full_reg<=0;fifo_empty_reg<=1;
end
else begin
wr_ptr<=wr_ptr_nxt;
rd_ptr<=rd_ptr_nxt;
fifo_full_reg<=full_nxt;
fifo_empty_reg<=empty_nxt;
end
end
always @(*)begin
//calcu;ation
wr_ptr_incr<=wr_ptr+1;
rd_ptr_incr<=rd_ptr+1;
//holding
wr_ptr_nxt<=wr_ptr;
rd_ptr_nxt<=rd_ptr;
full_nxt<=fifo_full_reg;
empty_nxt<=fifo_empty_reg;
case({write,read})
2'b00:begin end
2'b10:begin
if(~fifo_full_reg)begin
wr_ptr_nxt<=wr_ptr_incr;
empty_nxt<=0;
if(wr_ptr_incr==rd_ptr)
full_nxt<=1;
end
end
2'b01:begin
if(~fifo_empty_reg)begin
rd_ptr_nxt<=rd_ptr_incr;
full_nxt<=0;
if(rd_ptr_incr==wr_ptr)
empty_nxt<=1;
end
end
2'b11:begin
wr_ptr_nxt<=wr_ptr_incr;
rd_ptr_nxt<=rd_ptr_incr;
end
endcase
end
endmodule
