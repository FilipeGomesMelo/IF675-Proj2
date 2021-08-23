`timescale 1us/1ps

// Modulo para teste do arquivo timer.v
module latch_sr_TB ();

    reg R_TB, S_TB;
    wire Q_TB;

    latch_sr DUT(.Q(Q_TB), // saidas
                .S(S_TB), .R(R_TB)); // entradas

    initial begin
        $dumpfile("test/latch_sr_TB.vcd");
        $dumpvars(0,latch_sr_TB);

        #10;
        #10 S_TB = 1'b1; R_TB = 1'b0;
        #10 S_TB = 1'b0; R_TB = 1'b0;
        #10 S_TB = 1'b0; R_TB = 1'b1;
        #10 S_TB = 1'b0; R_TB = 1'b0;
        #10 S_TB = 1'b1; R_TB = 1'b0;
        #10 S_TB = 1'b0; R_TB = 1'b0;
        #10;
    end 
endmodule