module BCD(clk,Load,rst_asyn,Din,Q,Q_out);

input clk,Load,rst_asyn; 
input [3:0]Din;
output [3:0]Q;
reg [3:0]Q;
output [7:0] Q_out;      
reg [7:0] Q_out; 

always@ (posedge clk)begin
   if (!rst_asyn)
      Q <= 4'b0000; 
   else if(Load)
      Q <= Din;
   else if (Q == 9)
      Q <= 4'b0000;
   else
      Q <= Q +1;
end

always@(*) begin
     case (Q)
      4'b0000 : Q_out = 8'b11000000;
      4'b0001 : Q_out = 8'b11111001;
      4'b0010 : Q_out = 8'b10100100;
      4'b0011 : Q_out = 8'b10110000;
      4'b0100 : Q_out = 8'b10011001;
      4'b0101 : Q_out = 8'b10010010;
      4'b0110 : Q_out = 8'b10000010;
      4'b0111 : Q_out = 8'b11111000;
      4'b1000 : Q_out = 8'b10000000;
      4'b1001 : Q_out = 8'b10010000;
      4'b1010 : Q_out = 8'b10100000;
      4'b1011 : Q_out = 8'b10000011;
      4'b1100 : Q_out = 8'b10100111;
      4'b1101 : Q_out = 8'b10100001;
      4'b1110 : Q_out = 8'b10000100;
      4'b1111 : Q_out = 8'b11110001;
      default : Q_out = 8'b00000000;
     endcase
end
endmodule




