`ifndef PE_L
`define PE_L

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

real x;

always @(posedge clk) begin
    if (rst) begin
        x = 0;
        x_out = 0;
        c_out = 0;
        s_out = 0;
    end
    else begin
        x_out = - x * s_in + c_in * x_in;
        c_out = c_in;
        s_out = s_in;
        x = c_in * x + s_in * x_in;
    end
end
    
endmodule

`endif