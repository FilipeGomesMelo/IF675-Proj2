`timescale 1us/1ps

// Modulo para teste do arquivo timer.v
module timer_tb ();

    // entradas
    reg [3:0] data_TB;
    reg loadn_TB, clearn_TB, clock_TB, en_TB;

    // saidas
    wire [3:0] sec_ones_TB, sec_tens_TB, mins_TB;
    wire zero_TB;

    // auxiliar para o loop do nosso clock
    integer i;

    timer DUT(.data(data_TB), .loadn(loadn_TB), .clock(clock_TB), .clearn(clearn_TB), .en(en_TB), // entradas
              .sec_ones(sec_ones_TB), .sec_tens(sec_tens_TB), .mins(mins_TB), .zero(zero_TB)); // saidas

    // loop do clock
    initial begin
        $dumpfile("test/timer_tb.vcd");
        $dumpvars(0,timer_tb);
        
        for(i = 0; i < 2500; i = i+1) begin
            #5000 clock_TB <= !clock_TB;
        end
    end

    // teste das entradas, coloca dígito por dígito usando loadn, faz clearn dps que todo o tempo passa
    initial begin
        loadn_TB = 0;
        clearn_TB = 0;
        clock_TB = 1;
        en_TB = 0;
        // insere 8
        data_TB = 4'd8;
        #7500;
        // insere 5, passando o 8 para as dezenas dos segundos
        data_TB = 4'd5;
        #10000;
        // insere 7, passando 5 para as dezenas dos segundos e 8 para os minutos
        data_TB = 4'd7;
        #10000;
        // desativa o loadn e ativa o enable, começando a contagem
        loadn_TB = 1;
        en_TB = 1;
        // o clearn limpa o contador no negeedge, então vamos fazer o clearn ficar positivo e depois negativo
        #5700000;
        clearn_TB = 1;
        #8000;
        clearn_TB = 0;
    end
endmodule