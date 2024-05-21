`timescale 10ns/10ns
module alu_tb();

    parameter WIDTH = 4;
    parameter VECTOR_BITS_LENGTH = 5;

    logic [WIDTH-1:0] A, B, Result;
    logic [3:0] alu_flags;
    logic [1:0] alu_control;
    logic [WIDTH*2+2-1:0] vector [VECTOR_BITS_LENGTH:0];

    logic HS, LS, HI, LO;

    int i;

    alu #(WIDTH) dut(
        .a(A),
        .b(B),
        .alu_control(alu_control),
        .result(Result),
        .alu_flags(alu_flags)
    );


    structural_comparer dut2 (
        .Z(alu_flags[2]),
        .C(alu_flags[1]),
        .HS(HS),
        .LS(LS),
        .HI(HI),
        .LO(LO)
    );

    initial begin
        $readmemb("vectorTeste", vector);
        i = 0;
    end

    always begin
        {A, B, alu_control} = vector[i]; #1
        $display("A: %b - B: %b - alu_control: %b - alu_flags: %b - HS: %b - LS: %b - HI: %b - LO: %b", A, B, alu_control, alu_flags, HS, LS, HI, LO);
        i = i + 1;
        if(i >= VECTOR_BITS_LENGTH) begin
            $display("Finished!");
            $stop;
        end
    end

endmodule