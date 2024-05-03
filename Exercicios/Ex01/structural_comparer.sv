
module structural_comparer(
    input logic Z, C,
    output logic HS, LS, HI, LO
);

// Instantiating the gates as needed
// NOT gate for inverting C
logic notC;
not u1(notC, C);

// OR gate for LS
or u2(LS, Z, notC);

// NOT gate to generate HI from the output of the OR gate (LS)
not u3(HI, LS);

// Direct connection for HS and NOT gate output for LO
assign HS = C;  // Directly connect HS to Z
assign LO = notC;  // LO is the inverted value of C

endmodule