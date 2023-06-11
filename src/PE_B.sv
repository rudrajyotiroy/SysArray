`ifndef PE_B
`define PE_B

// Boundary Processing Element (PE)
module PE_B  (
    CTRL C,
    VLINK.IN SV_IN,
    HLINK.OUT SH_OUT,
    DLINK.IN D_IN,
    DLINK.OUT D_OUT
);

real d, d_temp, d_out_temp;

always @(posedge C.clk) begin
    if (C.rst) begin
        d <= 0;
        d_temp <= 0;
        d_out_temp <= 0;
        SH_OUT.s <= 0;
        SH_OUT.c <= 0;
        SH_OUT.z <= 0;
        D_OUT.d <= 0;
    end
    else begin
        SH_OUT.z = SV_IN.x;
        d_temp = C.beta_forget * C.beta_forget * d + D_IN.d * SV_IN.x * SV_IN.x;
        SH_OUT.c = C.beta_forget * C.beta_forget * d / d_temp;
        SH_OUT.s <= D_IN.d * SV_IN.x / d_temp;
        if (!C.freeze) begin
            d = d_temp;
        end
        D_OUT.d = d_out_temp; // For one clock cycle delay
        d_out_temp = SH_OUT.c * D_IN.d;
    end
end
    
endmodule

`endif