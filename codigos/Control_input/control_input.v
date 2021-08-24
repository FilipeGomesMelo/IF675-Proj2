// TODO// Nivel 2
module control_input (
    // entradas
    input wire [9:0] keypad,
    input wire clock, en,
    // saidas
    output wire [3:0] BCD,
    output wire loadn, pgt_1Hz);

    wire clock_div100, F;

    // primeiro modulo divide o clock por 100
    div100  div100(.clock(clock), .clearn(en), // entrada
                   .clock_div100(clock_div100)); // saida

    // encoder
    encoder encoder(.keypad(keypad), .en(en), // entradas
                    .BCD(BCD), .data_valid(loadn)); // saidas

    // contador mod8
    counter_mod8 counter(.clearn(loadn), .clock(clock), // entradas
                         .F(F)); // saidas

    mux_2to1 mux(.sel(en), .A(F), .B(clock_div100), // entradas
                 .F(pgt_1Hz)); // saida

endmodule
