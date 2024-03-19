class wr_xtn extends uvm_sequence_item;
  
  `uvm_object_utils(wr_xtn)
  
  rand bit [7:0] data;
  rand bit [7:0] address;
  bit response;
  bit reset;
  
  function  new(string name="wr_xtn");
    super.new(name);
  endfunction
  
  function void do_print(uvm_printer printer);
    printer.print_field("data",data,8,UVM_DEC);
	printer.print_field("address",address,8,UVM_DEC);
	printer.print_field("response",response,1,UVM_DEC);
	printer.print_field("reset",reset,1,UVM_DEC);
  endfunction
  
endclass