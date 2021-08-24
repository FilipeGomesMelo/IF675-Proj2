//      0
//   5     1
//      6
//   4     2
//      3
module decoder (input [3:0] sec_ones, sec_tens, mins,
                output [6:0] ones_saida, tens_saida, mins_saida);
    // digito dos minutos, é vazio sempre que é 0
    assign mins_saida = (mins === 4'b0000) ? 7'b000_0000 : // 0 a esquerda
                        (mins === 4'b0001) ? 7'b011_0000 : // 1
                        (mins === 4'b0010) ? 7'b110_1101 : // 2
                        (mins === 4'b0011) ? 7'b111_1001 : // 3
                        (mins === 4'b0100) ? 7'b011_0011 : // 4
                        (mins === 4'b0101) ? 7'b101_1011 : // 5
                        (mins === 4'b0110) ? 7'b001_1111 : // 6
                        (mins === 4'b0111) ? 7'b111_0000 : // 7
                        (mins === 4'b1000) ? 7'b111_1111 : // 8
                        (mins === 4'b1001) ? 7'b111_0011 : // 9
                        7'b000_0000;
    
    // digito das desenas dos segundos, é vazio sempre que é 0 e os minutos são 0
    assign tens_saida = ((sec_tens === 4'b0000 || sec_tens === 4'bXXXX) && (mins === 4'b0000 || mins === 4'bXXXX)) ? 7'b000_0000 : // 0 a esquerda
                        (sec_tens === 4'b0000) ? 7'b111_1110 : // 0
                        (sec_tens === 4'b0001) ? 7'b011_0000 : // 1
                        (sec_tens === 4'b0010) ? 7'b110_1101 : // 2
                        (sec_tens === 4'b0011) ? 7'b111_1001 : // 3
                        (sec_tens === 4'b0100) ? 7'b011_0011 : // 4
                        (sec_tens === 4'b0101) ? 7'b101_1011 : // 5
                        (sec_tens === 4'b0110) ? 7'b001_1111 : // 6
                        (sec_tens === 4'b0111) ? 7'b111_0000 : // 7
                        (sec_tens === 4'b1000) ? 7'b111_1111 : // 8
                        (sec_tens === 4'b1001) ? 7'b111_0011 : // 9
                        7'b000_0000;

    // digito das desenas dos segundos, é vazio sempre que todas entradas são 0
    assign ones_saida = ((sec_ones === 4'b0000 || sec_ones === 4'bXXXX) && (sec_tens === 4'b0000 || sec_tens === 4'bXXXX) && (mins === 4'b0000 || mins === 4'bXXXX)) ? 7'b000_0000 : // 0 a esquerda
                        (sec_ones === 4'b0000) ? 7'b111_1110 : // 0
                        (sec_ones === 4'b0001) ? 7'b011_0000 : // 1
                        (sec_ones === 4'b0010) ? 7'b110_1101 : // 2
                        (sec_ones === 4'b0011) ? 7'b111_1001 : // 3
                        (sec_ones === 4'b0100) ? 7'b011_0011 : // 4
                        (sec_ones === 4'b0101) ? 7'b101_1011 : // 5
                        (sec_ones === 4'b0110) ? 7'b001_1111 : // 6
                        (sec_ones === 4'b0111) ? 7'b111_0000 : // 7
                        (sec_ones === 4'b1000) ? 7'b111_1111 : // 8
                        (sec_ones === 4'b1001) ? 7'b111_0011 : // 9
                        7'b000_0000;
endmodule