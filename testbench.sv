module tb_traffic_light;
  reg clk,rst;
  wire [1:0] y;
  traffic_light uut(.clk(clk),.rst(rst),.y(y));
        always #10 clk=~clk;
                initial begin
                  $dumpfile("traffic_light.vcd");
                  $dumpvars(0,tb_traffic_light);
                  
                  clk=0; rst=1;
                  #20 rst=0;
                  
                  #400;
                  $finish;
                end
                endmodule