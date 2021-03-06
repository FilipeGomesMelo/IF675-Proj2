// Nivel 3
// contador decrescente mod6
module counter_mod8 (
    input wire clearn, // assincrono, active high
    input wire clock,
    output reg F); // indica se o contador chegou a 0

    reg [2:0] count;

    reg active_count;

    // para a contagem quando temos um posedge
    always @(posedge clearn) begin
        active_count = 1'b0;
    end

    // começa a contagem com negedge
    always @ (negedge clearn) begin
        count <= 3'b000;
        F <= 1'b0;
        active_count = 1'b1;
    end

    // loop principal para a contagem
    always @(posedge clock) begin
        // para a contagem caso o botão seja solto, evitando problemas de a pessoa soltar o botão antes da ativação
        // que passa o valor para o timer
        if (active_count) begin
            case (count)
                3'b000: count <= 3'b001; // 0 -> 1
                3'b001: count <= 3'b010; // 1 -> 2
                3'b010: count <= 3'b011; // 2 -> 3
                3'b011: begin  // 3 -> 4
                    count <= 3'b100;
                    F = 1'b1;
                end
                3'b100: count <= 3'b101; // 4 -> 5
                3'b101: count <= 3'b110; // 5 -> 6
                3'b110: count <= 3'b111; // 6 -> 7
                default: count <= count;
            endcase
        end
    end
endmodule

