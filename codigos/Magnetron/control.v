// controlador do magnetron
module control (
    input wire startn, stopn, clearn, door_closed, timer_done,
    output wire Q);

    // fios auxiliares que ligam o ON_OFF_logic com o latch_sr
    wire set, reset;

    // conecta o ON_OF_logic
    ON_OFF_logic U1 (.startn(startn), // entradas
                    .stopn(stopn),
                    .clearn(clearn),
                    .door_closed(door_closed),
                    .timer_done(timer_done),
                    .set(set), // saidas
                    .reset(reset));
    
    // conecta o latch_sr
    latch_sr U2 (.S(set), // entrada
                 .R(reset),
                 .Q(Q)); // saidas

endmodule
