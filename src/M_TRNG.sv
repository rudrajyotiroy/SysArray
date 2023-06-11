`ifndef M_TRNG
`define M_TRNG

module M_TRNG #(
    parameter N_DIM = 3
) (
    CTRL C,
    VLINK [N_DIM - 1] VIN;
    VLINK VOUT;
    DLINK DIAG;
);

// i for column j for row
genvar i,j;
generate
    for (i = 0; i < N_DIM; i = i + 1) begin
        PE_B PB0(C, VB[i][0], HB[i][0], DB[i], DB[i+1]); // Boundary Processors
        for (j = 0; j < N_DIM - i; j = j + 1) begin
            PE_L PL0(C, HB[i][j], HB[i][j+1], VB[i][j], VB[i+1][j]); // Internal Processors
        end
    end    
endgenerate


endmodule

`endif