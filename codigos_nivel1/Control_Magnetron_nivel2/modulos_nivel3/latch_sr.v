module latch_sr (
    input wire R, S,
    output wire Q);

    // reg auxiliar
    reg aux;
    assign Q = aux;

    // lógica do latch
    always @ * begin
        if ((S == 1'b0 && R == 1'b0) || (S == 1'b1 && R == 1'b1)) begin
            aux <= aux; 
        end
        else if (S == 1'b0 && R == 1'b1) begin 
            aux <= 1'b0; 
        end
        else if (S == 1'b1 && R == 1'b0) begin
            aux <= 1'b1;
        end 
    end
endmodule