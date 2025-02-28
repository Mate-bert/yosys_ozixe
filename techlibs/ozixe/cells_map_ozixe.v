module  \$_DFF_N_ (input D, C, output Q);
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    generate if (_TECHMAP_WIREINIT_Q_ === 1'b1)
        TRELLIS_FF #(.GSR("AUTO"), .CEMUX("1"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("SET"))  _TECHMAP_REPLACE_ (.CLK(C), .LSR(1'b0), .DI(D), .Q(Q));
    else
        TRELLIS_FF #(.GSR("AUTO"), .CEMUX("1"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("RESET"))  _TECHMAP_REPLACE_ (.CLK(C), .LSR(1'b0), .DI(D), .Q(Q));
    endgenerate
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module  \$_DFF_P_ (input D, C, output Q);
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    generate if (_TECHMAP_WIREINIT_Q_ === 1'b1)
        TRELLIS_FF #(.GSR("AUTO"), .CEMUX("1"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("SET"))  _TECHMAP_REPLACE_ (.CLK(C), .LSR(1'b0), .DI(D), .Q(Q));
    else
        TRELLIS_FF #(.GSR("AUTO"), .CEMUX("1"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("RESET"))  _TECHMAP_REPLACE_ (.CLK(C), .LSR(1'b0), .DI(D), .Q(Q));
    endgenerate
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module  \$_DFFE_NN_ (input D, C, E, output Q);
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    generate if (_TECHMAP_WIREINIT_Q_ === 1'b1)
        TRELLIS_FF #(.GSR("AUTO"), .CEMUX("INV"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("SET"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(1'b0), .DI(D), .Q(Q));
    else
        TRELLIS_FF #(.GSR("AUTO"), .CEMUX("INV"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("RESET"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(1'b0), .DI(D), .Q(Q));
    endgenerate
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module  \$_DFFE_PN_ (input D, C, E, output Q);
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    generate if (_TECHMAP_WIREINIT_Q_ === 1'b1)
        TRELLIS_FF #(.GSR("AUTO"), .CEMUX("INV"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("SET"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(1'b0), .DI(D), .Q(Q));
    else
        TRELLIS_FF #(.GSR("AUTO"), .CEMUX("INV"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("RESET"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(1'b0), .DI(D), .Q(Q));
    endgenerate
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module  \$_DFFE_NP_ (input D, C, E, output Q);
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    generate if (_TECHMAP_WIREINIT_Q_ === 1'b1)
        TRELLIS_FF #(.GSR("AUTO"), .CEMUX("CE"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("SET"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(1'b0), .DI(D), .Q(Q));
    else
        TRELLIS_FF #(.GSR("AUTO"), .CEMUX("CE"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("RESET"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(1'b0), .DI(D), .Q(Q));
    endgenerate
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module  \$_DFFE_PP_ (input D, C, E, output Q);
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    generate if (_TECHMAP_WIREINIT_Q_ === 1'b1)
        TRELLIS_FF #(.GSR("AUTO"), .CEMUX("CE"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("SET"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(1'b0), .DI(D), .Q(Q));
    else
        TRELLIS_FF #(.GSR("AUTO"), .CEMUX("CE"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("RESET"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(1'b0), .DI(D), .Q(Q));
    endgenerate
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module  \$_DFF_NP0_ (input D, C, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("1"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_DFF_NP1_ (input D, C, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("1"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("SET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_DFF_PP0_ (input D, C, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("1"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_DFF_PP1_ (input D, C, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("1"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("SET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule

module  \$_SDFF_NP0_ (input D, C, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("1"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("LSR_OVER_CE"))  _TECHMAP_REPLACE_ (.CLK(C), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_SDFF_NP1_ (input D, C, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("1"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("SET"), .SRMODE("LSR_OVER_CE"))  _TECHMAP_REPLACE_ (.CLK(C), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_SDFF_PP0_ (input D, C, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("1"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("LSR_OVER_CE"))  _TECHMAP_REPLACE_ (.CLK(C), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_SDFF_PP1_ (input D, C, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("1"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("SET"), .SRMODE("LSR_OVER_CE"))  _TECHMAP_REPLACE_ (.CLK(C), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule

module  \$_DFFE_NP0P_ (input D, C, E, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("CE"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_DFFE_NP1P_ (input D, C, E, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("CE"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("SET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_DFFE_PP0P_ (input D, C, E, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("CE"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_DFFE_PP1P_ (input D, C, E, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("CE"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("SET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule

module  \$_DFFE_NP0N_ (input D, C, E, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("INV"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_DFFE_NP1N_ (input D, C, E, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("INV"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("SET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_DFFE_PP0N_ (input D, C, E, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("INV"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_DFFE_PP1N_ (input D, C, E, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("INV"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("SET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule

module  \$_SDFFE_NP0P_ (input D, C, E, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("CE"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("LSR_OVER_CE"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_SDFFE_NP1P_ (input D, C, E, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("CE"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("SET"), .SRMODE("LSR_OVER_CE"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_SDFFE_PP0P_ (input D, C, E, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("CE"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("LSR_OVER_CE"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_SDFFE_PP1P_ (input D, C, E, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("CE"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("SET"), .SRMODE("LSR_OVER_CE"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule

module  \$_SDFFE_NP0N_ (input D, C, E, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("INV"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("LSR_OVER_CE"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_SDFFE_NP1N_ (input D, C, E, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("INV"), .CLKMUX("INV"), .LSRMUX("LSR"), .REGSET("SET"), .SRMODE("LSR_OVER_CE"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_SDFFE_PP0N_ (input D, C, E, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("INV"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("LSR_OVER_CE"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule
module  \$_SDFFE_PP1N_ (input D, C, E, R, output Q); TRELLIS_FF #(.GSR("AUTO"), .CEMUX("INV"), .CLKMUX("CLK"), .LSRMUX("LSR"), .REGSET("SET"), .SRMODE("LSR_OVER_CE"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(R), .DI(D), .Q(Q)); wire _TECHMAP_REMOVEINIT_Q_ = 1'b1; endmodule

module \$_ALDFF_NP_ (input C, L, AD, D, output Q); TRELLIS_FF #(.GSR("DISABLED"), .CEMUX("1"), .CLKMUX("INV"), .LSRMODE("PRLD"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .LSR(L), .DI(D), .M(AD), .Q(Q)); endmodule
module \$_ALDFF_PP_ (input C, L, AD, D, output Q); TRELLIS_FF #(.GSR("DISABLED"), .CEMUX("1"), .CLKMUX("CLK"), .LSRMODE("PRLD"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .LSR(L), .DI(D), .M(AD), .Q(Q)); endmodule

module \$_ALDFFE_NPN_ (input C, E, L, AD, D, output Q); TRELLIS_FF #(.GSR("DISABLED"), .CEMUX("INV"), .CLKMUX("INV"), .LSRMODE("PRLD"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(L), .DI(D), .M(AD), .Q(Q)); endmodule
module \$_ALDFFE_NPP_ (input C, E, L, AD, D, output Q); TRELLIS_FF #(.GSR("DISABLED"), .CEMUX("CE"), .CLKMUX("INV"), .LSRMODE("PRLD"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(L), .DI(D), .M(AD), .Q(Q)); endmodule
module \$_ALDFFE_PPN_ (input C, E, L, AD, D, output Q); TRELLIS_FF #(.GSR("DISABLED"), .CEMUX("INV"), .CLKMUX("CLK"), .LSRMODE("PRLD"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(L), .DI(D), .M(AD), .Q(Q)); endmodule
module \$_ALDFFE_PPP_ (input C, E, L, AD, D, output Q); TRELLIS_FF #(.GSR("DISABLED"), .CEMUX("CE"), .CLKMUX("CLK"), .LSRMODE("PRLD"), .LSRMUX("LSR"), .REGSET("RESET"), .SRMODE("ASYNC"))  _TECHMAP_REPLACE_ (.CLK(C), .CE(E), .LSR(L), .DI(D), .M(AD), .Q(Q)); endmodule

`include "cells_ff.vh"
`include "cells_io.vh"

`ifndef NO_LUT
module $lut (A, Y);
    parameter WIDTH = 0;       // Nombre d'entrées effectives (1 à 16)
    parameter LUT = 0;         // Valeur d'INIT originale sur 2^(WIDTH) bits

    (* force_downto *)
    input [WIDTH-1:0] A;
    output Y;

    // Compléter à 16 bits : par exemple, placer les bits d'entrée dans les bits de poids faibles
    // et compléter le reste par des zéros en MSB.
    wire [15:0] I = { {(16-WIDTH){1'b0}}, A };

    // Fonction pour étendre la table de vérité à 2^16 bits en répétant le motif original
    function [65535:0] extend_lut;
        input integer width;
        input [0:(1<<width)-1] lut_val; // lut_val est stocké dans l'ordre 0..2^(width)-1
        integer i;
        begin
            for (i = 0; i < (1<<16); i = i + 1) begin
                extend_lut[i] = lut_val[i % (1<<width)];
            end
        end
    endfunction

    // Définir la valeur étendue INIT_EXT
    localparam [65535:0] INIT_EXT = extend_lut(WIDTH, LUT);

    // Instancier la LUT16 générique
    LUT16 lut16_inst (
        .I(I),
        .O(Y)
    );
    defparam lut16_inst.INIT = INIT_EXT;
endmodule
`endif


module LUT16 (input [15:0] I, output O);
    parameter [65535:0] INIT = 65536'b0;
    assign O = INIT[{I[15], I[14], I[13], I[12],
                     I[11], I[10], I[9],  I[8],
                     I[7],  I[6],  I[5],  I[4],
                     I[3],  I[2],  I[1],  I[0]}];
endmodule
