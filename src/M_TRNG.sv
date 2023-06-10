`ifndef M_TRNG
`define M_TRNG

module M_TRNG #(
    parameter N_DIM = 3
) (
    input real [N_DIM - 1] x;
    input real y;
);

genvar i;
genvar j;
generate
    for (i = 0; i < N_DIM; i = i + 1) begin
        for (j = 0; j < i; j = j + 1) begin
        end
    end    
endgenerate


endmodule

`endif