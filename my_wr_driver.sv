class my_wr_driver extends uvm_driver #(wr_xtn);
  
  `uvm_component_utils(my_wr_driver)
  `uvm_register_cb(my_wr_driver,my_driver_callback) 
  
  function new(string name="my_wr_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  task run_phase(uvm_phase phase);
    forever
      begin
        seq_item_port.get_next_item(req);
        `uvm_do_callbacks(my_wr_driver,my_driver_callback,pre_send())
        send_to_dut(req);
        send_the_response(req);
        `uvm_do_callbacks(my_wr_driver,my_driver_callback,post_send())
      end
  endtask
  
  task send_to_dut(wr_xtn req);
    $display(">>>>>>>>>>>>>>>>>>>>>>SEND TO DUT>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	req.print();
  endtask
  
  task send_the_response(wr_xtn rsp);
    $display(">>>>>>>>>>>>>>>>>>>>>>>>>RESPONSE FROM DRIVER>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    rsp=wr_xtn::type_id::create("rsp");
    rsp.response = 1;
    rsp.set_id_info(req);
    seq_item_port.item_done(rsp);
    //rsp.print();
  endtask

endclass