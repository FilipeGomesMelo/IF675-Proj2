// TODO
module ON_OFF_logic (
    input wire startn, stopn, clearn, door_closed, timer_done,
    output reg set, reset);

    always @ * begin
        // caso a porta estiver aberta ou o stop ou o clearn ou o timer estiverem ativados
        if (!door_closed || !stopn || !clearn || timer_done) begin
            set = 0;
            reset = 1;
        end
        // caso o start estiver ativo (active low) e a porta estiver fechada, ligamos o set e desligamos o reset
        else if (!startn && door_closed) begin
            set = 1;
            reset = 0;
        end
    end

endmodule