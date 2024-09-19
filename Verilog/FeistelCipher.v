module feistel(p, k, c, rst, clk);
    input [31:0] p;
    input [15:0] k;
    input rst, clk;
    
    output [31:0]c;
    
    reg [15:0]l, r, w;
    
    always @(posedge(clk), rst)
       begin
           if(rst == 1)
           begin
               l = 16'b0000_0000_0000_0000;
               r = 16'b0000_0000_0000_0000;
               w = 0;
         // 32Bit C;
           end
           
           else
           begin
               l <= p[31:16];
               r <= p[15:0];
               
               w = ~({l[10:0], l[15:11]} ^ l);
               w = w^r^k;
               
               
           end
       end
    assign c[31:16] = w;
    assign c[15:0] = l;
   endmodule
                