module encoder (
    input wire [9:0] keypad,
    input wire en,
    output wire [3:0] BCD,
    output reg data_valid);

    // mapeamento da entrada para BCD
    assign BCD = (keypad == 10'b0000_000_001 && !en) ? 4'b0000 :
                 (keypad == 10'b0000_000_010 && !en) ? 4'b0001 :
                 (keypad == 10'b0000_000_100 && !en) ? 4'b0010 :
                 (keypad == 10'b0000_001_000 && !en) ? 4'b0011 :
                 (keypad == 10'b0000_010_000 && !en) ? 4'b0100 :
                 (keypad == 10'b0000_100_000 && !en) ? 4'b0101 :
                 (keypad == 10'b0001_000_000 && !en) ? 4'b0110 :
                 (keypad == 10'b0010_000_000 && !en) ? 4'b0111 :
                 (keypad == 10'b0100_000_000 && !en) ? 4'b1000 :
                 (keypad == 10'b1000_000_000 && !en) ? 4'b1001 :
                 4'bXXXX;

    // controle do data_valid
    always @(keypad, en) begin
        if ((keypad == 10'b0000_000_000) || en) data_valid = 1'b1; 
        else data_valid = 1'b0;
    end
    
endmodule 
