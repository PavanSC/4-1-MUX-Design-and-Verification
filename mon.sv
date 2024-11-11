class mon extends uvm_monitor;
 `uvm_component_utils(mon)

virtual mux_if mif;
uvm_analysis_port #(trans) m2s;
trans m;

function new(string name="mon",uvm_component parent =null);
 super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 if(!uvm_config_db#(virtual mux_if)::get(this,"","mux_if",mif))
   `uvm_fatal("CONFIG","Have u set it?")
 m2s=new("m2s",this);
 m=trans::type_id::create("m",this);
 endfunction

 virtual task run_phase(uvm_phase phase);
  forever begin
   #10;
   m.i0 = mif.i0;
   m.i1 = mif.i1;
   m.i2 = mif.i2;
   m.i3 = mif.i3;
   m.sel = mif.sel;
   m.y = mif.y;
   `uvm_info("MON",$sformatf("Sent to SB I0 :%0d , I1 :%0d, I2 :%0d, I3 :%0d, SEL :%0d, Y:%0d",m.i0,m.i1,m.i2,m.i3,m.sel,m.y), UVM_NONE);
   m2s.write(m);
  end
endtask

endclass
