`ifndef MUL
`define MUL

module MUL (
    CTRL C,
    VLINK.IN SV_IN,
    DLINK.IN D_IN,
    VLINK.OUT SV_OUT
);

    always @(posedge C.clk) begin
        if (C.rst) begin
            SV_OUT.x <= 0;
        end
        else begin
            SV_OUT.x <= SV_IN.x * D_IN.d;
        end
    end

endmodule

`endif