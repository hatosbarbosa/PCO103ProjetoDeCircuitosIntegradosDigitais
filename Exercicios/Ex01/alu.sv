module alu # (parameter width = 4)
            (input logic signed [width-1:0] a, b,
            input logic [1:0] alu_control,
            output logic signed [width-1:0] result,
            output logic [4:0] alu_flags);

logic [width-1:0] condinvb;
logic [width:0] sum;

assign condinvb = alu_control[0] ? ~b : b;

assign sum = a + condinvb + alu_control[0];

always_comb begin : alwayscmb
    case (alu_control[1:0])
        2'b00: result = sum;
        2'b01: result = sum;
        2'b10: result = a & b;
        2'b11: result = a | b; 
    endcase
    //Negative: 
    alu_flags[3] = result[width-1];
    //Zero:
    alu_flags[2] = (result == 0);
    //Carry:
    alu_flags[1] = alu_control[1] & sum[width];
    //Overflow
    alu_flags[0] = ~(alu_control[1]) & (a[width-1] ^ sum[width-1]) & ~(alu_control[0] ^ a[width-1] ^ b[width-1]); 
end

endmodule