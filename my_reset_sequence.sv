class my_reset_sequence extends uvm_sequence#(wr_xtn);
  
  `uvm_object_utils(my_reset_sequence)
  wr_xtn xtn;
  
  function new(string name="my_reset_sequence");
    super.new(name);
  endfunction
  
  /*task pre_body();
    if(starting_phase != null)
      $display($time,">>>>>>>>>>>RAISE SEQUENCE OBJECTION>>>>>>>>>>>>>>>>>>>");
    starting_phase.raise_objection(this);
  endtask*/
  
  task body();
    $display($time,">>>>>>>>>>>>>>>>>>>DEFAULT SEQUENCE>>>>>>>>>>>>>>>>>>>>>>>>");

    if(starting_phase != null)
      starting_phase.raise_objection(this,"start_of_default_sequence");
    $display($time,">>>>>>>>>>>>>>>>RAISE SEQUENCE OBJECTION>>>>>>>>>>>>>>>>>>>");
    
    
    xtn=wr_xtn::type_id::create("xtn");
    
    $display($time,">>>>>>>>>>>>>>>>START OF DEFAULT SEQUENCE>>>>>>>>>>>>>>>>>>>");
    start_item(xtn);
    
    /*if(!xtn.randomize() with {xtn.reset == 1;})
      `uvm_fatal("xtn_SEQUENCE","RANDOMIZATION FAILED");*/
    assert(xtn.randomize() with {xtn.reset == 1;});
    
    finish_item(xtn);
    $display($time,">>>>>>>>>>>FINISH DEFAULT SEQUENCE>>>>>>>>>>>>>>>>>>>");
    
    if(starting_phase != null)
      starting_phase.drop_objection(this,"end_of_default_sequence");
    
    $display($time,">>>>>>>>>>>DROP SEQ OBJECTION>>>>>>>>>>>>>>>>>>>");
  endtask
  
  /*task post_body();
    if(starting_phase != null) starting_phase.drop_objection(this);
  endtask*/

endclass