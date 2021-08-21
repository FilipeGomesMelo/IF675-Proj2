// Nivel 2
// Junção dos contadores para fazer o minutes/seconds timer
module timer (
    input wire [3:0] data, // entrada de dados
    input wire loadn, // sicrono, active low
    input wire clearn, // assincrono, active high
    input wire clock,
    input wire en, // enable, active high
    output wire [3:0] sec_ones, sec_tens, mins, // saida da unidade dos segundos, dezena dos segundos, e minutos
    output wire zero); // indica que todos valores são 0

    wire en_sec_tens, en_mins;
    wire zero_sec_ones, zero_sec_tens, zero_sec_mins;

    // primeiro contador, casa das unicades dos segundos
    counter_mod10 seconds_ones(.loadn(loadn),
                          .clearn(clearn),
                          .clock(clock),
                          .en(en),
                          .data(data),
                          .tc(en_sec_tens),
                          .zero(zero_sec_ones),
                          .digit(sec_ones));

    // segundo contador, casa das dezenas dos segundos
    counter_mod6 seconds_tens(.loadn(loadn),
                          .clearn(clearn),
                          .clock(clock),
                          .en(en_sec_tens),
                          .data(sec_ones),
                          .tc(en_mins),
                          .zero(zero_sec_tens),
                          .digit(sec_tens));

    // terceiro contador, casa das unidades dos minutos
    // nota, não precisamos ligar o tc do terceiro contador a nada
    // então não vamos fazer nenhum bind na saida tc
    counter_mod10 minutes(.loadn(loadn),
                          .clearn(clearn),
                          .clock(clock),
                          .en(en_mins),
                          .data(sec_tens),
                          .zero(zero_sec_mins),
                          .digit(mins));
    
    assign zero = zero_sec_ones && zero_sec_tens && zero_sec_mins;
endmodule
