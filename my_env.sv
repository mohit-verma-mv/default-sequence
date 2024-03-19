class my_env extends uvm_env;
  
  `uvm_component_utils(my_env)
  my_wr_agent my_wr_agent_h;
  //my_rd_agent my_rd_agent_h;
  
  function new(string name="my_env",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    my_wr_agent_h=my_wr_agent::type_id::create("my_wr_agent_h",this);
    //my_rd_agent_h=my_rd_agent::type_id::create("my_rd_agent_h",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    uvm_top.print_topology;
  endfunction

endclass