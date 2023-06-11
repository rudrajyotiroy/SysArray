`ifndef INTERFACES
`define INTERFACES

// The global link connected to all PEs
interface CTRL ();
    input logic clk;
    input logic rst;
    input logic freeze;
    input real beta_forget;
endinterface //CTRL

/*
The following type of link is defined below
    |
   _V_
  |   |
  |___|
    |
    V
*/
interface VLINK ();
    real x;
    modport IN (input x);
    modport OUT (output x);
endinterface
/*
The following type of link is defined below
     ___
___\|   |___\
   /|___|   /
*/
interface HLINK ();
    real s;
    real c;
    real z;
    modport IN (input s, input c, input z);
    modport OUT (output s, output c, output z);
endinterface
/*
The following type of link is defined below
       |
       |   ---> Same as VLINK.IN
       V
      ( ) ___\  
     (_ _)   /  ---> Same as HLINK.OUT 
      (_)
  
*/
/*
The following type of link is defined below
 \
   \
    _|
      ( ) 
     (_ _)   
      (_) \
            \
             _| 
*/
interface DLINK ();
    real d;
    modport IN (input d);
    modport OUT (output d);
endinterface

interface DATA_IN # (parameter N_DIM = 3);
    input real [N_DIM - 1] x;
    input real y;
endinterface // DATA_IN

interface DATA_OUT # (parameter N_DIM = 3);
    output real [N_DIM - 1] w;
    output real e;
    output logic irq;
endinterface // DATA_OUT

`endif