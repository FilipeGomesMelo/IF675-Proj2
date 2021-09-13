module mux_2to1 (
    input wire sel, A, B,
    output wire F);

    assign F = (sel == 1'b0) ? A : B;

endmodule 