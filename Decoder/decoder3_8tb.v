module decoder3_8_tb;
reg [2:0] a;
wire [7:0] y;
reg [3:0] i;

decoder3_8 uut (
    .a(a),
    .y(y)
);

initial begin
        $dumpfile("decoder_wave.vcd"); 
        $dumpvars(0, decoder3_8_tb);  

        $monitor("Time=%0t | a=%b | y=%b", $time, a, y);
        
        for (i = 0; i < 8; i = i + 1) begin
            a = i;
            #10;
        end

        $finish;
    end
endmodule