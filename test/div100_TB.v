`timescale 1us/1ps

// Modulo para teste do arquivo timer.v
module div100_TB ();

    reg clock_TB = 1;
    wire clock_div100_TB;

    div100 DUT(.clock_div100(clock_div100_TB), // saidas
                .clock(clock_TB)); // entradas

    integer i;

    initial begin
        $dumpfile("test/div100_TB.vcd");
        $dumpvars(0,div100_TB);

        for(i = 0; i < 2500; i = i+1) begin
            #5000 clock_TB <= !clock_TB;
        end
    end 
endmodule