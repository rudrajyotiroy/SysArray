`ifndef CU
`define CU
//TBD

// Control Unit for Operating the SysArray
module CU # (parameter N_DIM = 3); 
(
    CTRL C,
    DATA_IN D_IN,
    DATA_OUT D_OUT
);
int ctr;
real [N_DIM - 1] DIN;
real [N_DIM - 1] DOUT;
real e, irq;

VLINK [N_DIM - 1] VIN;
VLINK VOUT;
DLINK DIAG;

M_TRNG M1 (C, VIN, VOUT, DIAG);
// Counter run logic
always @(posedge C.rst) ctr = 0; // Make counter 0
always @(C.freeze) ctr = 0; // Make counter 0
always @(posedge C.clk) begin
    if(!C.rst) begin
        ctr = ctr + 1; 
    end
end

// Input drive logic
genvar i;
generate
    for (i=0; i<N_DIM; i = i + 1) begin
        always @(ctr) begin
            if (C.freeze) begin
                //TODO
            end
            else begin
                if(ctr =< N_DIM && ctr > 0) begin
                    VIN[i].x <= (ctr > i) ? 0 : DIN[i];   
                end
                else if(ctr < 2*N_DIM && ctr > N_DIM) begin
                    VIN[i].x <= (ctr > i) ? 0 : DIN[i];   
                end
            end
        end
    end
endgenerate

// Load data in array

generate
    for (i=0; i<N_DIM; i = i + 1) begin
        always @negedge(C.rst) begin
            @posedge(C.clk);
            DIN[i] = D_IN.x[i];
        end
    end
endgenerate

    
endmodule

`endif