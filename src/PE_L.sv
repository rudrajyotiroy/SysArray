`ifndef PE_L
`define PE_L

// Internal Processing Element (PE)
module PE_L  (
    CTRL C,
    HLINK.IN SH_IN,
    HLINK.OUT SH_OUT,
    VLINK.IN SV_IN,
    VLINK.OUT SV_OUT
);

real r;

always @(posedge C.clk) begin
    if (C.rst) begin
        r <= 0;
        SH_OUT.s <= 0;
        SH_OUT.c <= 0;
        SH_OUT.z <= 0;
        SV_OUT.x <= 0;
    end
    else begin
        SH_OUT.s <= SH_IN.s;
        SH_OUT.c <= SH_IN.c;
        SH_OUT.z <= SH_IN.z;
        SV_OUT.x = SV_IN.x - r * SH_IN.z;
        if (!C.freeze) begin
            r = SH_IN.s * SV_IN.x + SH_IN.c * r;
        end
    end
end
    
endmodule

`endif