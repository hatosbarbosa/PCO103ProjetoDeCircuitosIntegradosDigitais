`timescale 10ns/10ns
module alu_tb();

    parameter WIDTH = 4;
    parameter VECTOR_BITS_LENGTH = 16;

    logic [WIDTH-1:0] A, B, Result;
    logic [3:0] alu_flags;
    logic [1:0] alu_control;
    logic [WIDTH*2+2-1:0] vector [VECTOR_BITS_LENGTH:0];

    int i;

    alu #(WIDTH) dut(
        .a(A),
        .b(B),
        .alu_control(alu_control),
        .result(Result),
        .alu_flags(alu_flags)
    );


    initial begin
        $readmemb("vectorTeste", vector);
        i = 0;
    end

    always begin
        {A, B, alu_control} = vector[i]; #1
        $display("A %b - B %b - alu_control - %b", A, B, alu_control);
        i = i + 1;
        if(i >= VECTOR_BITS_LENGTH) begin
            $display("Finished!");
            $stop;
        end
    end

endmodule