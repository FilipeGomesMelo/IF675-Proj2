`timescale 1us/1ps
module timer_tb ();

    reg [3:0] data_TB;
    reg loadn_TB, clearn_TB, clock_TB, en_TB;

    integer i;

    timer DUT(.data(data_TB), .loadn(loadn_TB), .clock(clock_TB),
    .clearn(clearn_TB), .en(en_TB));

    initial begin
        $dumpfile("test/timer_tb.vcd");
        $dumpvars(0,timer_tb);
        
        for(i = 0; i < 2500; i = i+1) begin
            #5000 clock_TB <= !clock_TB;
        end
    end


    initial begin
        loadn_TB = 0;
        clearn_TB = 0;
        clock_TB = 1;
        en_TB = 0;
        data_TB = 4'd8;
        #7500;
        data_TB = 4'd5;
        #10000;
        data_TB = 4'd7;
        #10000;
        loadn_TB = 1;
        en_TB = 1;
        #5700000;
        clearn_TB = 1;
        #8000;
        clearn_TB = 0;
    end
    
endmodule