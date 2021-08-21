// Nivel 3
// contador decrescente mod6
module counter_mod6 (
    input wire [3:0] data,
    input wire loadn, // sicrono, active low
    input wire clearn, // assincrono, active high
    input wire clock,
    input wire en, // active high
    output reg [3:0] digit,
    output wire tc, // vira high quando o counter chega a 0 para ativar o prox contador da cadeia
    output wire zero); // indica se o contador chegou a 0

    assign tc = ((digit == 0) & en) ? 1 : 0;
    assign zero = (digit == 0) ? 1 : 0;

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
                4'b0101: digit <= 4'b0100; // 5 -> 4
                4'b0100: digit <= 4'b0011; // 4 -> 3
                4'b0011: digit <= 4'b0010; // 3 -> 2
                4'b0010: digit <= 4'b0001; // 2 -> 1
                4'b0001: digit <= 4'b0000; // 1 -> 0
                4'b0000: digit <= 4'b0101; // 0 -> 5
                default: digit <= digit;
            endcase
        end
        else if (!loadn) digit <= data;
    end
endmodule

