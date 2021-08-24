`timescale 1us/1ps

// Modulo para teste do arquivo timer.v
module control_input_TB ();

    reg [9:0] keypad_TB;
    reg en_TB, clock_TB;
    wire [3:0] BCD_TB;
    wire loadn_TB, pgt_1Hz_TB;

    control_input DUT(.BCD(BCD_TB), // saidas
                .loadn(loadn_TB),
                .pgt_1Hz(pgt_1Hz_TB),
                // entradas
                .keypad(keypad_TB),
                .en(en_TB),
                .clock(clock_TB));

    integer i;

    initial begin
        $dumpfile("test/control_input_TB.vcd");
        $dumpvars(0,control_input_TB);

        for(i = 0; i < 2500; i = i+1) begin
            #5000 clock_TB <= !clock_TB;
        end
    end 

    initial begin
        clock_TB = 1'b1;
        keypad_TB = 10'b0000_000_001; en_TB = 1'b1;
        #100000 en_TB = 1'b0;
        #100000 keypad_TB = 10'b0000_000_000;
        #100000 keypad_TB = 10'b0000_010_000;
        #100000 keypad_TB = 10'b0000_000_000;
        #100000 keypad_TB = 10'b1000_000_000;
        #25000 en_TB = 1'b1;
    end 
endmodule