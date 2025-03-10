// -----------------------------------------------------------------------------
// Fichier : cells_map_ozixe.v
// Description : Remplacement des primitives FF par une implémentation générique OZIXE_FF
// Auteur : Mateo Bertolelli
// -----------------------------------------------------------------------------

// Déclaration de votre flip‑flop générique OZIXE_FF
(* techmap_cell, blackbox *)
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

//---------------------------------------------------------------------
// Remplacement de toutes les cellules FF par une instanciation uniforme
//---------------------------------------------------------------------

// Pas de reset externe, tie rst à 0
module \$_DFF_N_ (input D, C, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(1'b0), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_DFF_P_ (input D, C, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(1'b0), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

// Pour les FF avec enable (DFFE_*), nous ignorons le signal enable.
module \$_DFFE_NN_ (input D, C, E, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(1'b0), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_DFFE_PN_ (input D, C, E, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(1'b0), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_DFFE_NP_ (input D, C, E, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(1'b0), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_DFFE_PP_ (input D, C, E, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(1'b0), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

// Variantes FF avec port reset (NP et PP)
module \$_DFF_NP0_ (input D, C, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_DFF_NP1_ (input D, C, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_DFF_PP0_ (input D, C, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_DFF_PP1_ (input D, C, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

// Variantes SDFF (avec reset et éventuellement enable)
// Ici, on ne différencie pas et on utilise simplement rst (le signal R)
module \$_SDFF_NP0_ (input D, C, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_SDFF_NP1_ (input D, C, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_SDFF_PP0_ (input D, C, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_SDFF_PP1_ (input D, C, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

// Variantes avec enable et reset (DFFE_NP0P, DFFE_NP1P, DFFE_PP0P, DFFE_PP1P)
module \$_DFFE_NP0P_ (input D, C, E, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_DFFE_NP1P_ (input D, C, E, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_DFFE_PP0P_ (input D, C, E, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_DFFE_PP1P_ (input D, C, E, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

// Variantes avec enable et reset (DFFE_NP0N, DFFE_NP1N, DFFE_PP0N, DFFE_PP1N)
module \$_DFFE_NP0N_ (input D, C, E, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_DFFE_NP1N_ (input D, C, E, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_DFFE_PP0N_ (input D, C, E, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_DFFE_PP1N_ (input D, C, E, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

// Variantes SDFFE avec enable et reset (SDFFE_NP0P, SDFFE_NP1P, SDFFE_PP0P, SDFFE_PP1P)
module \$_SDFFE_NP0P_ (input D, C, E, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_SDFFE_NP1P_ (input D, C, E, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_SDFFE_PP0P_ (input D, C, E, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_SDFFE_PP1P_ (input D, C, E, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

// Variantes SDFFE avec enable et reset, version "NP" (NP0N, NP1N, PP0N, PP1N)
module \$_SDFFE_NP0N_ (input D, C, E, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_SDFFE_NP1N_ (input D, C, E, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_SDFFE_PP0N_ (input D, C, E, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

module \$_SDFFE_PP1N_ (input D, C, E, R, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(R), .D(D), .Q(Q));
    wire _TECHMAP_REMOVEINIT_Q_ = 1'b1;
endmodule

// Variantes ALDFF (asynchronous load DFF) – ici, nous traitons également de la même façon.
module \$_ALDFF_NP_ (input C, L, AD, D, output Q);
    // Pour la version ALDFF, le port L est utilisé pour la réinitialisation (reset)
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(L), .D(D), .Q(Q));
endmodule

module \$_ALDFF_PP_ (input C, L, AD, D, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(L), .D(D), .Q(Q));
endmodule

module \$_ALDFFE_NPN_ (input C, E, L, AD, D, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(L), .D(D), .Q(Q));
endmodule

module \$_ALDFFE_NPP_ (input C, E, L, AD, D, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(L), .D(D), .Q(Q));
endmodule

module \$_ALDFFE_PPN_ (input C, E, L, AD, D, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(L), .D(D), .Q(Q));
endmodule

module \$_ALDFFE_PPP_ (input C, E, L, AD, D, output Q);
    OZIXE_FF _TECHMAP_REPLACE_ (.clk(C), .rst(L), .D(D), .Q(Q));
endmodule

// Inclusion éventuelle des fichiers d'en-tête (à conserver tels quels)
`include "cells_ff.vh"
`include "cells_io.vh"

`ifndef NO_LUT
module $lut (A, Y);
    parameter WIDTH = 0;       // Nombre d'entrées effectives (1 à 16)
    parameter [0:(1<<WIDTH)-1] LUT = 0;  // Valeur d'INIT originale sur 2^(WIDTH) bits 
    //parameter LUT = 0;

    (* force_downto *)
    input [WIDTH-1:0] A; 
    output Y;

    generate
        if (WIDTH == 1) begin
            assign Y = ~A[0];
        end else
        if (WIDTH == 2) begin
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(A[0]), .I1(A[1]), .I2(0), .I3(0));
        end else
        if (WIDTH == 3) begin
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(0));
        end else
        if (WIDTH == 4) begin
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
        end else
        if (WIDTH == 5) begin
            wire f0, f1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(0), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(f0), .I1(f1), .I2(0), .I3(0)); 
        end else
        if (WIDTH == 6) begin
            wire f0, f1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(f0), .I1(f1), .I2(0), .I3(0));
        end else
        if (WIDTH == 7) begin
            wire f0, f1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(f0), .I1(f1), .I2(0), .I3(0));
        end else
        if (WIDTH == 8) begin
            wire f0, f1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(f0), .I1(f1), .I2(0), .I3(0));
        end else
        if (WIDTH == 9) begin
            wire f0, f1, f2
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(0), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(f0), .I1(f1), .I2(f2), .I3(0));
        end else
        if (WIDTH == 10) begin
            wire f0, f1, f2
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(f0), .I1(f1), .I2(f2), .I3(0));
        end else
        if (WIDTH == 11) begin
            wire f0, f1, f2
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(f0), .I1(f1), .I2(f2), .I3(0));
        end else
        if (WIDTH == 12) begin
            wire f0, f1, f2
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(f0), .I1(f1), .I2(f2), .I3(0));
        end else
        if (WIDTH == 13) begin
            wire f0, f1, f2, f3
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(0), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
        end else
        if (WIDTH == 14) begin
            wire f0, f1, f2, f3
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
        end else
        if (WIDTH == 15) begin
            wire f0, f1, f2, f3
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
        end else
        if (WIDTH == 16) begin
            wire f0, f1, f2, f3
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
        end else
        if (WIDTH == 17) begin
            wire f0, f1, f2, f3, d0, g0, g1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d0),
            .I0(A[0]), .I1(0), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g0),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g1),
            .I0(d0), .I1(0), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(g0), .I1(g1), .I2(0), .I3(0));
        end else
        if (WIDTH == 18) begin
            wire f0, f1, f2, f3, d0, g0, g1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d0),
            .I0(A[0]), .I1(A[1]), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g0),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g1),
            .I0(d0), .I1(0), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(g0), .I1(g1), .I2(0), .I3(0));
        end else
        if (WIDTH == 19) begin
            wire f0, f1, f2, f3, d0, g0, g1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g0),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g1),
            .I0(d0), .I1(0), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(g0), .I1(g1), .I2(0), .I3(0));
        end else
        if (WIDTH == 20) begin
            wire f0, f1, f2, f3, d0, g0, g1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g0),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g1),
            .I0(d0), .I1(0), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(g0), .I1(g1), .I2(0), .I3(0));
        end else
        if (WIDTH == 21) begin
            wire f0, f1, f2, f3, d0, d1, g0, g1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d1),
            .I0(A[0]), .I1(0), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g0),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g1),
            .I0(d0), .I1(d1), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(g0), .I1(g1), .I2(0), .I3(0));
        end else
        if (WIDTH == 22) begin
            wire f0, f1, f2, f3, d0, d1, g0, g1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d1),
            .I0(A[0]), .I1(A[1]), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g0),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g1),
            .I0(d0), .I1(d1), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(g0), .I1(g1), .I2(0), .I3(0));
        end else
        if (WIDTH == 23) begin
            wire f0, f1, f2, f3, d0, d1, g0, g1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g0),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g1),
            .I0(d0), .I1(d1), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(g0), .I1(g1), .I2(0), .I3(0));
        end else
        if (WIDTH == 24) begin
            wire f0, f1, f2, f3, d0, d1, g0, g1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g0),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g1),
            .I0(d0), .I1(d1), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(g0), .I1(g1), .I2(0), .I3(0));
        end else
        if (WIDTH == 25) begin
            wire f0, f1, f2, f3, d0, d1, d2, g0, g1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d2),
            .I0(A[0]), .I1(0), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g0),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g1),
            .I0(d0), .I1(d1), .I2(d2), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(g0), .I1(g1), .I2(0), .I3(0));
        end else
        if (WIDTH == 26) begin
            wire f0, f1, f2, f3, d0, d1, d2, g0, g1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d2),
            .I0(A[0]), .I1(A[1]), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g0),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g1),
            .I0(d0), .I1(d1), .I2(d2), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(g0), .I1(g1), .I2(0), .I3(0));
        end else
        if (WIDTH == 27) begin
            wire f0, f1, f2, f3, d0, d1, d2, g0, g1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g0),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g1),
            .I0(d0), .I1(d1), .I2(d2), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(g0), .I1(g1), .I2(0), .I3(0));
        end else
        if (WIDTH == 28) begin
            wire f0, f1, f2, f3, d0, d1, d2, g0, g1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g0),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g1),
            .I0(d0), .I1(d1), .I2(d2), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(g0), .I1(g1), .I2(0), .I3(0));
        end else
        if (WIDTH == 29) begin
            wire f0, f1, f2, f3, d0, d1, d2, d3, g0, g1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d3),
            .I0(A[0]), .I1(0), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g0),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g1),
            .I0(d0), .I1(d1), .I2(d2), .I3(d3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(g0), .I1(g1), .I2(0), .I3(0));
        end else
        if (WIDTH == 30) begin
            wire f0, f1, f2, f3, d0, d1, d2, d3, g0, g1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d3),
            .I0(A[0]), .I1(A[1]), .I2(0), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g0),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g1),
            .I0(d0), .I1(d1), .I2(d2), .I3(d3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(g0), .I1(g1), .I2(0), .I3(0));
        end else
        if (WIDTH == 31) begin
            wire f0, f1, f2, f3, d0, d1, d2, d3, g0, g1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(0));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g0),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g1),
            .I0(d0), .I1(d1), .I2(d2), .I3(d3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(g0), .I1(g1), .I2(0), .I3(0));
        end else
        if (WIDTH == 32) begin
            wire f0, f1, f2, f3, d0, d1, d2, d3, g0, g1
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(f3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d0),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d1),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d2),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(d3),
            .I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g0),
            .I0(f0), .I1(f1), .I2(f2), .I3(f3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(g1),
            .I0(d0), .I1(d1), .I2(d2), .I3(d3));
            LUT4 #(.INIT(LUT)) _TECHMAP_REPLACE_ (.O(Y),
            .I0(g0), .I1(g1), .I2(0), .I3(0));
        end else

    endgenerate

    /*
    // Compléter à 16 bits : placer les bits d'entrée dans les bits de poids faibles
    wire [15:0] I = { {(16-WIDTH){1'b0}}, A }; // Concaténation (si A a une largeur de 4 alors wire sera "0000 0000 0000 "4 bits de A")

    // Étendre la table de vérité à 2^16 bits en répétant le motif original.
    localparam integer REPL = (1 << (16 - WIDTH)); // on réplique l'entrée sur WIDTH bits sur tous les bits restant 
    localparam [65535:0] INIT_EXT = { REPL { LUT } };

    // Instancier le module LUT16 
    LUT16 lut16_inst (
        .I(I),
        .O(Y)
    );
    defparam lut16_inst.INIT = INIT_EXT; */
endmodule
`endif

//module LUT16 (input [15:0] I, output O);
//    parameter [65535:0] INIT = 65536'b0;
//    assign O = INIT[{I[15], I[14], I[13], I[12],
//                     I[11], I[10], I[9],  I[8],
//                     I[7],  I[6],  I[5],  I[4],
//                     I[3],  I[2],  I[1],  I[0]}];
//endmodule

module LUT4 (input [3:0] I, output O);
    parameter [15:0] INIT = 16'b0;
    assign O = INIT[{I[3], I[2], I[1], I[0]}];
endmodule

module LUT2 (input [1:0] I, output O);
    parameter [3:0] INIT = 3'b0;
    assign O = INIT[{I[1], I[0]}];
endmodule
