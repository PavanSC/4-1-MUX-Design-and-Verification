class seq extends uvm_sequence#(trans);
 `uvm_object_utils(seq)

 trans t;

 function new(string name="seq");
  super.new(name);
 endfunction

 virtual task body();
 t=trans::type_id::create("t");
  repeat(50)
  begin
   start_item(t);
   t.randomize();
   `uvm_info("SEQ",$sformatf("Data send to Driver I0 :%0d , I1 :%0d, I2 :%0d, I3 :%0d, SEL :%0d",t.i0,t.i1,t.i2,t.i3,t.sel), UVM_NONE);
   finish_item(t);
   end
 endtask

endclass
