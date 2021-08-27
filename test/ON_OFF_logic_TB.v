`timescale 1us/1ps

// Modulo para teste do arquivo timer.v
module ON_OFF_logic_TB ();

    reg startn_TB, stopn_TB, clearn_TB, door_closed_TB, timer_done_TB;
    wire set_TB, reset_TB;

    ON_OFF_logic DUT(
                // saidas
                .set(set_TB),
                .reset(reset_TB),
                // entradas
                .startn(startn_TB),
                .stopn(stopn_TB),
                .clearn(clearn_TB),
                .door_closed(door_closed_TB),
                .timer_done(timer_done_TB));

    initial begin
        $dumpfile("test/ON_OFF_logic_TB.vcd");
        $dumpvars(0,ON_OFF_logic_TB);

        stopn_TB = 1'b1; clearn_TB = 1'b1; timer_done_TB = 1'b0;

        // liga
        #10 startn_TB = 1'b0; door_closed_TB = 1'b0;
        #10 startn_TB = 1'b0; door_closed_TB = 1'b1;
        #10 startn_TB = 1'b1; door_closed_TB = 1'b1;
        // desliga
        #10 startn_TB = 1'b1; door_closed_TB = 1'b0;
        // liga
        #10 startn_TB = 1'b0; door_closed_TB = 1'b0;
        #10 startn_TB = 1'b0; door_closed_TB = 1'b1;
        #10 startn_TB = 1'b1; door_closed_TB = 1'b1;
        // desliga
        #10 stopn_TB = 1'b0;
        #10 stopn_TB = 1'b1;
        // liga
        #10 startn_TB = 1'b0; door_closed_TB = 1'b0;
        #10 startn_TB = 1'b0; door_closed_TB = 1'b1;
        #10 startn_TB = 1'b1; door_closed_TB = 1'b1;
        // desliga
        #10 clearn_TB = 1'b0;
        #10 clearn_TB = 1'b1;
        // liga
        #10 startn_TB = 1'b0; door_closed_TB = 1'b0;
        #10 startn_TB = 1'b0; door_closed_TB = 1'b1;
        #10 startn_TB = 1'b1; door_closed_TB = 1'b1;
        // desliga
        #10 timer_done_TB = 1'b1;
        #10 timer_done_TB = 1'b0;
        // tenta ligar enquanto o stopn, clearn ou timer estao ativos
        #10 stopn_TB = 1'b0;
        #10 startn_TB = 1'b1; door_closed_TB = 1'b1;
        #10 startn_TB = 1'b0;
        #10 startn_TB = 1'b1;
        #10 stopn_TB = 1'b1; clearn_TB = 1'b0;
        #10 startn_TB = 1'b0; door_closed_TB = 1'b1;
        #10 startn_TB = 1'b1;
        #10 clearn_TB = 1'b1; timer_done_TB = 1'b1;
        #10 startn_TB = 1'b0;
        #10 startn_TB = 1'b1;
        #10 timer_done_TB = 1'b0;
        #10;
    end 
endmodule