`ifndef BUF
`define BUF

// Horizontal Buffer
module HBUF  
(
    CTRL C,
    HLINK.IN SH_IN,
    HLINK.OUT SH_OUT
);

always @(posedge C.clk) begin
    if (C.rst) begin
        SH_OUT.s <= 0;
        SH_OUT.c <= 0;
        SH_OUT.z <= 0;
    end
    else begin
        SH_OUT.s <= SH_IN.s;
        SH_OUT.c <= SH_IN.c;
        SH_OUT.z <= SH_IN.z;
    end
end

endmodule

// Vertical Buffer
module VBUF  
(
    CTRL C,
    VLINK.IN SV_IN,
    VLINK.OUT SV_OUT
);

always @(posedge C.clk) begin
    if (C.rst) begin
        SV_OUT.x <= 0;
    end
    else begin
        SV_OUT.x <= SH_IN.x;
    end
end

endmodule

`endif