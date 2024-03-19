class my_driver_callback extends uvm_callback;
  
  function new(string name="my_driver_callback");
    super.new(name);
  endfunction
  
  static string type_name="my_driver_callback";
  
  virtual function string get_type_name();
    return type_name;
  endfunction
  
  virtual task pre_send();
    $display(">>>>>>>>>>>>>>>>>>callback driver pre_send Delaying driver by 20>>>>>>>");
    #20;
  endtask
  
  virtual task post_send();
    $display(">>>>>>>>>>>>>>>CALLBACK_DRIVER post_send method >>>>>>>>> ");
  endtask

endclass