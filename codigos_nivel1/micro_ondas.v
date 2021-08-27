// TODO// Nivel 2
module micro_ondas (
    // entradas
    input wire [9:0] keypad,
    input wire clock, startn, stopn, clearn, door_closed,
    // saidas
    output wire [6:0] sec_ones_segs, sec_tens_segs, mins_segs, mins_tens_segs,
    output wire mag_on);

    wire zero, loadn, pgt_1Hz;
    wire [3:0] BCD, sec_ones, sec_tens, mins;


    // primeiro modulo divide o clock por 100
    control_mag  M (// entradas
                     .startn(startn),
                     .stopn(stopn),
                     .clearn(clearn),
                     .door_closed(door_closed),
                     .timer_done(zero),
                     // saidas
                     .Q(mag_on));

    // encoder
    control_input C (.keypad(keypad), .clock(clock), .en(mag_on), // entradas
                     .BCD(BCD), .loadn(loadn), .pgt_1Hz(pgt_1Hz)); // saidas

    // contador mod8
    timer T (// entradas
             .data(BCD),
             .loadn(loadn),
             .clearn(clearn),
             .clock(pgt_1Hz),
             .en(mag_on),
             // saidas
             .sec_ones(sec_ones),
             .sec_tens(sec_tens),
             .mins(mins),
             .zero(zero));

    decoder D (// entradas
               .sec_ones(sec_ones),
               .sec_tens(sec_tens),
               .mins(mins),
               // saidas
               .ones_saida(sec_ones_segs),
               .tens_saida(sec_tens_segs),
               .mins_saida(mins_segs),
               .mins_tens_saida(mins_tens_segs));

endmodule
 