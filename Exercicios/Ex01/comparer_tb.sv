`timescale 10ns/10ns
module comparer_tb();
    logic Z, C;
    logic HS, LS, HI, LO;

    structural_comparer dut(Z, C, HS, LS, HI, LO);

    initial begin
        $display("Time=%t Z=%b C=%b | HS=%b LS=%b HI=%b LO=%b", $time, Z, C, HS, LS, HI, LO);
        Z = 0; C = 0; #10;
        Z = 0; C = 1; #10;
        Z = 1; C = 0; #10;
        Z = 1; C = 1; #10;
    end
endmodule