module div100 (
    input wire clock, clearn,
    output reg clock_div100);

    integer aux = 0;

    always @(posedge clearn) begin
        aux = 0;
    end

    always @(posedge clock) begin
        if (aux == 100) begin
           clock_div100 = 1'b1;
           aux = 0; 
        end
        else clock_div100 = 1'b0;
        aux = aux + 1;
    end

endmodule