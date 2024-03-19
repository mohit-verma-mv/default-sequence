class my_wr_sequencer extends uvm_sequencer#(wr_xtn);
  
  `uvm_component_utils(my_wr_sequencer)
  
  function new(string name="my_wr_sequencer",uvm_component parent);
    super.new(name,parent);
  endfunction

endclass