class my_wr_monitor extends uvm_monitor;
  
  `uvm_component_utils(my_wr_monitor)
  
  function new(string name="my_wr_monitor",uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass