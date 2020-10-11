module divider
   (
    //Input clock
    input wire 	     clk,
    //Sets the output clock divider, notice changing this without reseting will potentially create a glitch
    input wire [0:7] divider,
    //Module reset triggers on a rising edge, and keeps reseting while high
    input wire 	     reset, 

    //The output frequency = (clk/2)/(divider+1)
    output reg 	     out
    );

   reg [0:7] 	     counter;
 		     

   always @(posedge clk or posedge reset) begin;
      if (reset) begin
	 counter <= 0;
	 out <= 0;
      end
      else begin
	 if (counter == divider ) begin
	    counter <= 0;
	    out = ~out;
	 end
	 else begin    
	    counter++;
	 end
      end
   end
     
endmodule // divider

       
