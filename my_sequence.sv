class my_sequence extends uvm_sequence#(wr_xtn);
  
  `uvm_object_utils(my_sequence)
  
  wr_xtn req;
  wr_xtn rsp;
  
  function new(string name="my_sequence");
    super.new(name);
  endfunction
  
  task body();
    repeat(10)
      begin
        req=wr_xtn::type_id::create("req");
        start_item(req);
        if(!req.randomize())
          `uvm_fatal("SEQUENCE","SEQUENCE RANDOMIZATION FAILED")
          finish_item(req);
        get_response(rsp);
        rsp.print();
      end
    //`uvm_do(req);
    ///`uvm_rand_send(req);
    //`uvm_do_with(req,{data inside{[0:30]};address inside{[0:30]};})
    //end
  endtask

endclass