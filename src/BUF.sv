`ifndef BUF
`define BUF

module PE_L  (
    input real x_in,
    input real c_in,
    input real s_in,
    input clk,
    input rst,
    output real x_out,
    output real c_out,
    output real s_out
);

always @(posedge clk) begin
    if (rst) begin
        x_out = 0;
        c_out = 0;
        s_out = 0;
    end
    else begin
        x_out = x_in;
        c_out = c_in;
        s_out = s_in;
    end
end

endmodule

`endif