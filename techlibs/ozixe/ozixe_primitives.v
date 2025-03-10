(* keep *)
module LUT4 (input [3:0] I, output O);
    parameter [15:0] INIT = 16'b0;
    assign O = INIT[{I[3], I[2], I[1], I[0]}];
endmodule

(* keep *)
module LUT2 (input [1:0] I, output O);
    parameter [3:0] INIT = 3'b0;
    assign O = INIT[{I[1], I[0]}];
endmodule
