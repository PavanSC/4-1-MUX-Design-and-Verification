class drv extends uvm_driver#(trans);
 `uvm_component_utils(drv)

virtual mux_if dif;
trans d;

function new(string name="drv",uvm_component parent =null);
 super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 d=trans::type_id::create("d",this);
 if(!uvm_config_db#(virtual mux_if)::get(this,"","mux_if",dif))
   `uvm_fatal("CONFIG","Have u set it?")
 endfunction

 task run_phase(uvm_phase phase);
  forever begin
  seq_item_port.get_next_item(d);
  dif.i0 <= d.i0;
  dif.i1 <= d.i1;
  dif.i2 <= d.i2;
  dif.i3 <= d.i3;
  dif.sel <= d.sel;
  `uvm_info("DRV",$sformatf("Trigger DUT I0 :%0d , I1 :%0d, I2 :%0d, I3 :%0d, SEL :%0d",d.i0,d.i1,d.i2,d.i3,d.sel), UVM_NONE);
  seq_item_port.item_done();
  #10;
 end
endtask

endclass