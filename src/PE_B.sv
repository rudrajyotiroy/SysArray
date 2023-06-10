`ifndef PE_B
`define PE_B

module PE_B  (
    input real x_in,
    input clk,
    input rst,
    output real c_out,
    output real s_out
);

real x, x_temp;

always @(posedge clk) begin
    if (rst) begin
        x = 0;
        c_out = 0;
        s_out = 0;
    end
    else begin
        x_temp = $sqrt(x*x + x_in*x_in);
        c_out = x/x_temp;
        s_out = x_in/x_temp;
        x = x_temp;
    end
end
    
endmodule

`endif