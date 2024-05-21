
module structural_comparer(
    input logic Z, C,
    output logic HS, LS, HI, LO
);

logic notC;
not u1(notC, C);

or u2(LS, Z, notC);

not u3(HI, LS);


assign HS = C;  
assign LO = notC; 

endmodule