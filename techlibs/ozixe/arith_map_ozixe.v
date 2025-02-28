/*
	CRÉATION DE OZIXE
	Auteur : Bertolelli Mateo et son amie le C
*/
(* techmap_celltype = "$alu" *)
module full_adder_lut16 (
    input  A,
    input  B,
    input  Cin,
    output Sum,
    output Cout
);
    // On va créer un signal de 4 bits pour la LUT, où l'on place nos 3 entrées et une constante 0.
    // Par exemple, on peut définir : I = { 1'b0, Cin, B, A }.
    wire [3:0] I = {1'b0, Cin, B, A};

    // On doit construire une entrée de 16 bits pour la LUT16 du package,
    // en plaçant nos 4 bits dans les 4 bits de poids faibles et en
    // complétant le reste par des zéros.
    wire [15:0] LUT_input = {12'b0, I};

    // La table de vérité pour Sum (full adder/additionneur) pour les 8 premiers indices :
    // A  B  Cin | Sum  Cout
    // 0  0  0  :   0    0   -> 0
    // 0  0  1  :   1    0   -> 1
    // 0  1  0  :   1    0   -> 1
    // 0  1  1  :   0    1   -> 0
    // 1  0  0  :   1    0   -> 1
    // 1  0  1  :   0    1   -> 0
    // 1  1  0  :   0    1   -> 0
    // 1  1  1  :   1    1   -> 1
    //
    // Pour la LUT16, on définit le paramètre INIT sur 16 bits.
    // Pour Sum, on pourra par exemple étendre ce motif aux 16 cases (les 8
    // cases supérieures seront identiques).
    localparam [15:0] INIT_SUM = 16'b0110100101101001; 

    // Pour Cout, la table (pour les 8 premières cases) est :
    // 0:0, 1:0, 2:0, 3:1, 4:0, 5:1, 6:1, 7:1.
    localparam [15:0] INIT_COUT = 16'b1110100011101000; 

    // On instancie deux LUT16 :
    LUT16 lut_sum (.I(LUT_input), .O(Sum));
    defparam lut_sum.INIT = INIT_SUM;
    
    LUT16 lut_cout (.I(LUT_input), .O(Cout));
    defparam lut_cout.INIT = INIT_COUT;
    
endmodule

module adder_16bit (
    input  [15:0] A,
    input  [15:0] B,
    input         Cin,
    output [15:0] Sum,
    output        Cout
);
    wire [15:0] carry;
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin: full_adder_array
            if (i == 0) begin
                full_adder_lut16 fa (
                    .A(A[i]),
                    .B(B[i]),
                    .Cin(Cin),
                    .Sum(Sum[i]),
                    .Cout(carry[i])
                );
            end else begin
                full_adder_lut16 fa (
                    .A(A[i]),
                    .B(B[i]),
                    .Cin(carry[i-1]),
                    .Sum(Sum[i]),
                    .Cout(carry[i])
                );
            end
        end
    endgenerate
    assign Cout = carry[15];
endmodule



