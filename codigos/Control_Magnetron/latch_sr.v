module latch_sr (
    input wire R, S,
    output wire Q);

    // reg auxiliar
    reg aux = 0;
    assign Q = aux;

    // lógica do latch
    always @(S, R) begin
        if (!S && R) aux = 0;
        else if (S && !R) aux = 1;
    end
endmodule