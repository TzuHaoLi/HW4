`timescale 1ns/1ps //設定時間參數

module BCD_tb();

reg clk, rst_asyn,Load;
reg [3:0]Din;
wire [3:0]Q;
wire [7:0]Q_out;

parameter PERIOD = 20;
parameter real DUTY_CYCLE = 0.5;
parameter OFFSET = 0; 

initial
    begin   
        #OFFSET;
        forever
            begin
                clk = 1'b1;
                #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b0;
                #(PERIOD*DUTY_CYCLE);
            end
        end
initial begin
    rst_asyn = 1'b0;
    Load = 1'b0;
    Din = 5;
    #5 rst_asyn = 1'b1;
    #350 Load = 1'b0;
    #20 Load = 1'b1;
    #10 Load = 1'b0;
    #200 rst_asyn = 1'b0;
    #50 rst_asyn = 1'b1;
    #1000 $finish;
end
initial
    begin
        $dumpfile("BCD_to7segm.vcd"); 
        $dumpvars(0,BCD_tb);  
    end
BCD BCD1_tb(
    .clk(clk),
    .Load(Load),
    .rst_asyn(rst_asyn),
    .Din(Din),
    .Q(Q),
    .Q_out(Q_out)
);
endmodule