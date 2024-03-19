`include "uvm_macros.svh"
import uvm_pkg::*;
`include "package.sv"


module top;
  
  initial
    begin
      run_test("error_injection");
    end

endmodule