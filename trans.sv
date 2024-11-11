class trans extends uvm_sequence_item;

 `uvm_object_utils(trans)

 rand logic [3:0] i0;
 rand logic [3:0] i1;
 rand logic [3:0] i2;
 rand logic [3:0] i3;
 rand logic [1:0] sel;
 bit [3:0] y;

  function new(string name="trans");
    super.new(name);
  endfunction

virtual function void do_print(uvm_printer printer);
 super.do_print(printer);
 printer.print_field("I0","this.i0",4,UVM_BIN);
 printer.print_field("I1","this.i1",4,UVM_BIN);
 printer.print_field("I2","this.i2",4,UVM_BIN);
 printer.print_field("I3","this.i3",4,UVM_BIN);
 printer.print_field("SEL","this.sel",2,UVM_BIN); 
 printer.print_field("Y","this.y",4,UVM_BIN);
endfunction

endclass