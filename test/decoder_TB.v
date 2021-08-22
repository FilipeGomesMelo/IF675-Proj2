`timescale 1us/1ps

module decoder_TB ();

    reg [3:0] sec_ones_TB, sec_tens_TB, mins_TB;
    wire [6:0] ones_saida_TB, tens_saida_TB, mins_saida_TB;

    decoder DUT(.sec_ones(sec_ones_TB), .sec_tens(sec_tens_TB), .mins(mins_TB), // saidas
    .ones_saida(ones_saida_TB), .tens_saida(tens_saida_TB), .mins_saida(mins_saida_TB)); // entradas

    initial begin
        $dumpfile("test/decoder_TB.vcd");
        $dumpvars(0,decoder_TB);

            sec_ones_TB = 4'b0000; sec_tens_TB = 4'b0000; mins_TB = 4'b0000;
        #10 sec_ones_TB = 4'b0001;
        #10 sec_ones_TB = 4'b0101;
        #10 sec_ones_TB = 4'b1001;
        #10 sec_tens_TB = 4'b0010;
        #10 sec_tens_TB = 4'b1000;
        #10 sec_tens_TB = 4'b0100;
        #10 mins_TB = 4'b0011; sec_tens_TB = 4'b0000; 
        #10 mins_TB = 4'b0110;
        #10 mins_TB = 4'b0111; sec_ones_TB = 4'b0000;
        #10;
    end    
endmodule