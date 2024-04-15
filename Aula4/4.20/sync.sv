module sync(input logic clk, input logic d, output logic q, n);

logic n1;

always_ff @( posedge clk ) 
begin 
    n1 <= d; //nonblocking assignment
    q <= n1;    
end

assign n = n1;

endmodule