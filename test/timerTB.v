`timescale 1us/1ps
module timer_tb ();

    reg [3:0] data_in;
    reg loadn, clear, clock, enable;

    integer i;

    timer DUT(.data(data_in), .loadn(loadn), .clock(clock),
    .clearn(clear), .en(enable));

    initial begin
        $dumpfile("timer_tb.vcd");
        $dumpvars(0,timer_tb);
        
        for(i = 0; i < 3005; i = i+1) begin
            #5000 clock <= ~clock;
        end
    end


    initial begin
        loadn = 0;
        clear = 0;
        clock = 1;
        enable = 1;
        data_in = 4'd5;
        #16000;
        loadn = 1;
        #100000;
        clear = 1;
        #8000;
        clear = 0;
    end
    
endmodule