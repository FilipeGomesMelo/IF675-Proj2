`timescale 1us/1ps

module counter_mod8_TB ();

    reg clock_TB, clearn_TB;
    wire F_TB;

    counter_mod8 DUT(.F(F_TB), // saidas
                    .clock(clock_TB), .clearn(clearn_TB)); // entradas

    integer i;

    // loop do clock
    initial begin
        $dumpfile("test/counter_mod8_TB.vcd");
        $dumpvars(0,counter_mod8_TB);
        for(i = 0; i < 70; i = i+1) begin
            #5000 clock_TB <= !clock_TB;
        end
    end

    initial begin
        clock_TB = 1'b0;
        #25000 clearn_TB = 1'b0;
        #50000 clearn_TB = 1'b1;
        #25000;
        #25000 clearn_TB = 1'b0;
        #25000 clearn_TB = 1'b1;
        #25000 clearn_TB = 1'b0;
        #12500 clearn_TB = 1'b1;
        #25000;
        #25000 clearn_TB = 1'b0;
        #10000 clearn_TB = 1'b1;
        #10000 clearn_TB = 1'b0;
    end    
endmodule