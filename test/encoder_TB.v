`timescale 1us/1ps

// Modulo para teste do arquivo timer.v
module encoder_TB ();

    reg [9:0] keypad_TB;
    reg en_TB;
    wire [3:0] BCD_TB;
    wire data_valid_TB;

    encoder DUT(.BCD(BCD_TB), // saidas
                .data_valid(data_valid_TB), 
                // entradas
                .keypad(keypad_TB),
                .en(en_TB));

    initial begin
        $dumpfile("test/encoder_TB.vcd");
        $dumpvars(0,encoder_TB);

        keypad_TB = 10'b0000_000_001; en_TB = 1'b1;
        #10 en_TB = 1'b0;
        #10 keypad_TB = 10'b0000_000_000;
        #10 keypad_TB = 10'b0000_010_000;
        #10 keypad_TB = 10'b0000_000_000;
        #10 keypad_TB = 10'b1000_000_000;
        #10;
    end 
endmodule