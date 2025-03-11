(* keep *)
module LUT4 (input I0, I1, I2, I3, output O);
    parameter [15:0] INIT = 16'b0;
    assign O = INIT[{I3, I2, I1, I0}];
endmodule

(* keep *)
module OZIXE_FF (
    input  clk,
    input  rst,  // réinitialisation asynchrone active à 1
    input  D,
    output reg Q
);
    always @(posedge clk or posedge rst)
        if (rst)
            Q <= 1'b0;
        else
            Q <= D;
endmodule
