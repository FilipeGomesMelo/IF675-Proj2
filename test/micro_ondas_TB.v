`timescale 1us/1ps

// Modulo para teste do arquivo timer.v
module micro_ondas_TB ();

    reg [9:0] keypad_TB;
    reg clock_TB, startn_TB, stopn_TB, clearn_TB, door_closed_TB;
    wire [6:0] sec_ones_segs_TB, sec_tens_segs_TB, mins_segs_TB;
    wire mag_on_TB;

    micro_ondas DUT(// entradas
                .keypad(keypad_TB),
                .clock(clock_TB),
                .startn(startn_TB),
                .clearn(clearn_TB),
                .door_closed(door_closed_TB),
                .stopn(stopn_TB),
                // saidas
                .sec_ones_segs(sec_ones_segs_TB),
                .sec_tens_segs(sec_tens_segs_TB),
                .mins_segs(mins_segs_TB),
                .mag_on(mag_on_TB));

    integer i;

    initial begin
        $dumpfile("test/micro_ondas_TB.vcd");
        $dumpvars(0,micro_ondas_TB);

        for(i = 0; i < 20000; i = i+1) begin
            #5000 clock_TB <= !clock_TB;
        end
    end 

    initial begin
        clock_TB = 1'b1;
        startn_TB = 1'b1; stopn_TB = 1'b1; clearn_TB = 1'b1; door_closed_TB = 1'b1;
        // teste de entrada dos valores
        #5000 keypad_TB = 10'b0000_000_010;
        #100000 keypad_TB = 10'b0000_000_000;
        #5000 keypad_TB = 10'b0000_001_000;
        #100000 keypad_TB = 10'b0000_000_000;
        #5000 keypad_TB = 10'b0000_100_000;
        #100000 keypad_TB = 10'b0000_000_000;
        // #25000 startn_TB = 1'b0;
        // #25000 startn_TB = 1'b1;
        
        // teste de clearn
        // #25000 clearn_TB = 1'b0;
        // #25000 clearn_TB = 1'b1;
        
        // inicializa o microondas
        #25000 startn_TB = 1'b0;
        #25000 startn_TB = 1'b1;
        
        // tentando fazer inputs enquanto o microondas está ativo
        //#5000 keypad_TB = 10'b0000_000_100;
        //#100000 keypad_TB = 10'b0000_000_000;
        //#5000 keypad_TB = 10'b0000_100_000;
        //#100000 keypad_TB = 10'b0000_000_000;
        //#5000 keypad_TB = 10'b0000_000_010;
        //#100000 keypad_TB = 10'b0000_000_000;
        
        // parando o microondas enquanto está ativo usando o stop
        // #500000 stopn_TB = 1'b0;
        // #500000 stopn_TB = 1'b1;
        
        // parando o microondas enquanto está ativo abrindo a porta
        // #600000 door_closed_TB = 1'b0;
        // #600000 door_closed_TB = 1'b1;
        // #600000;

        // parando o microondas com o clearn de clearn
        // #25000 clearn_TB = 1'b0;
        // #25000 clearn_TB = 1'b1;

        // reinicializando o microondas depois de ser interrompido
        // #25000 startn_TB = 1'b0;
        // #25000 startn_TB = 1'b1;
    end 
endmodule