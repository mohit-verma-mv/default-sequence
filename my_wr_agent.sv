class my_wr_agent extends uvm_agent;
  
  `uvm_component_utils(my_wr_agent)
  my_wr_driver            my_wr_driver_h;
  my_wr_sequencer      my_wr_sequencer_h;
  my_wr_monitor          my_wr_monitor_h;
  
  function new(string name="my_wr_agent",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    my_wr_driver_h = my_wr_driver::type_id::create("my_wr_driver_h",this);
    my_wr_sequencer_h = my_wr_sequencer::type_id::create("my_wr_sequencer_h",this);
    my_wr_monitor_h = my_wr_monitor::type_id::create("my_wr_monitor_h",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    my_wr_driver_h.seq_item_port.connect(my_wr_sequencer_h.seq_item_export);
  endfunction

endclass