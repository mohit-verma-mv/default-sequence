class base_test extends uvm_test;
  
  `uvm_component_utils(base_test)
  
  my_env my_env_h;
  my_sequence my_sequence_h;
  my_reset_sequence my_reset_sequence_h;
  
  function new(string name="base_test",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    my_env_h = my_env::type_id::create("my_env_h",this);
    my_sequence_h = my_sequence::type_id::create("my_sequence_h");
    my_reset_sequence_h = my_reset_sequence::type_id::create("my_reset_sequence_h");
    //uvm_config_db#(uvm_sequence_base)::set(this,"my_env_h.my_wr_agent_h.my_wr_sequencer_h.reset_phase","default_sequence",my_reset_sequence_h);
    uvm_config_db#(uvm_object_wrapper)::set(this,
                                            "my_env_h.my_wr_agent_h.my_wr_sequencer_h.reset_phase",
                                            "default_sequence",
                                            my_reset_sequence::type_id::get());
    uvm_config_db#(uvm_sequence_base)::dump();
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    $display($time,">>>>>>>>>>>>>>>>>>>START OF RUN_PHASE>>>>>>>>>>>>>>>>>>>>>>>>");
    #1;
    my_sequence_h.start(my_env_h.my_wr_agent_h.my_wr_sequencer_h);
    #100;
    $display($time,">>>>>>>>>>>>>>>>>>>END OF RUN_PHASE>>>>>>>>>>>>>>>>>>>>>>>>");
    phase.drop_objection(this);
  endtask

endclass

class error_injection extends base_test;
  
  `uvm_component_utils(error_injection)
  
  my_driver_callback callback_h;
  my_wr_driver my_wr_driver_h;
  
  function new(string name="error_injection",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    callback_h=new("callback_h");
    uvm_callbacks#(my_wr_driver,my_driver_callback)::add(my_wr_driver_h,callback_h);
  endfunction

endclass