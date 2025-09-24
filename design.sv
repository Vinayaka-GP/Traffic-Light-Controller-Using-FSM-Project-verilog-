// Code your design here
module traffic_light(clk,rst,y);
  input clk,rst;
  output reg [1:0] y;
  
  parameter red=2'b00,
  			green=2'b01,
  			yellow=2'b10;
  
  reg[1:0] state;
  reg[3:0] counter;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst==1) begin
        state<=red;
        counter<=0;
        y<=state; end
      else
        begin
          counter<=counter+1;
      		case(state)
        		red:begin
                  if(counter==4'd9) begin
            		state<=green;
                    counter<=0; end
          		else begin
            		state<=red;
                  	y<=state; end
                  end
                 green:begin
                   if(counter==4'd7) begin
                     state<=yellow;
                     counter<=0; end
                   else begin
                     state<=green;
                     y<=state; end
                 end
                  yellow:begin
                    if(counter==4'd4) begin
                      state<=red;
                      counter<=0; end
                    else begin
                      state<=yellow;
                      y<=state; end
                  end
                  
              default begin
                state<=red;
                y<=state;
              end
            endcase
        end
    end
endmodule
                     
                     