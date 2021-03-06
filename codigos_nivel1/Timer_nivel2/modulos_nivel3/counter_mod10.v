// Nivel 3
// contador decrescente mod10
module counter_mod10 (
    input wire [3:0] data,
    input wire loadn, // sicrono, active low
    input wire clearn, // assincrono, active low
    input wire clock,
    input wire en, // active high
    output reg [3:0] digit,
    output wire tc, // vira high quando o counter chega a 0 para ativar o prox contador da cadeia
    output wire zero); // indica se o contador chegou a 0

    assign tc = ((digit == 4'b0000) && en);
    assign zero = (digit === 4'b0000  || digit === 4'bXXXX) ? 1'b1 : 1'b0;

    // limpa o digit de forma assincrona quando clearn está ativo (acive low)
    always @ (negedge clearn) begin
        digit <= 4'b0000;
    end

    // digit recebe data de forma sincrona quando loadn está ativo (active low)
    // loop principal para a contagem
    always @(posedge clock) begin
        // so conta quando en está ativo (active high)
        if (en) begin
            case (digit)
                4'b1001: digit <= 4'b1000; // 9 -> 8
                4'b1000: digit <= 4'b0111; // 8 -> 7
                4'b0111: digit <= 4'b0110; // 7 -> 6
                4'b0110: digit <= 4'b0101; // 6 -> 5
                4'b0101: digit <= 4'b0100; // 5 -> 4
                4'b0100: digit <= 4'b0011; // 4 -> 3
                4'b0011: digit <= 4'b0010; // 3 -> 2
                4'b0010: digit <= 4'b0001; // 2 -> 1
                4'b0001: digit <= 4'b0000; // 1 -> 0
                4'b0000: digit <= 4'b1001; // 0 -> 9
                default: digit <= 4'b0000;
            endcase
        end  
        else if (!loadn) digit <= data;
    end
endmodule

