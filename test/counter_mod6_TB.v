`timescale 1us/1ps

module counter_mod6_TB ();

    // entradas
    reg [3:0] data_TB;
    reg loadn_TB, clearn_TB, clock_TB, en_TB;

    // saidas
    wire [3:0] digit_TB;
    wire zero_TB, tc_TB;

    counter_mod6 seconds_ones(
                          // entradas
                          .loadn(loadn_TB),
                          .clearn(clearn_TB),
                          .clock(clock_TB),
                          .en(en_TB),
                          .data(data_TB),
                          // saidas
                          .tc(tc_TB),
                          .zero(zero_TB),
                          .digit(digit_TB));

    integer i;

    // loop do clock
    initial begin
        $dumpfile("test/counter_mod6_TB.vcd");
        $dumpvars(0,counter_mod6_TB);
        for(i = 0; i < 140; i = i+1) begin
            #5000 clock_TB <= !clock_TB;
        end
    end

    initial begin
        clock_TB = 1'b0; data_TB = 4'b0110; loadn_TB = 1'b1; clearn_TB = 1'b1; en_TB = 1'b0;
        #50000 loadn_TB = 1'b0;
        #50000 loadn_TB = 1'b1;
        #50000 en_TB = 1'b1;
        #100000;
        #50000 en_TB = 1'b0;
        #50000 clearn_TB = 1'b0;
        #50000 clearn_TB = 1'b1;
        #50000 en_TB = 1'b1;
        #100000;
        #50000 clearn_TB = 1'b0;
        #50000 clearn_TB = 1'b1;
    end    
endmodule