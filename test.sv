class test extends uvm_test;
 `uvm_component_utils(test)

env envh;
seq s;

 function new(string name="test",uvm_component parent=null);
  super.new(name,parent);
 endfunction


 virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  envh=env::type_id::create("envh",this);
  s=seq::type_id::create("s",this);
 endfunction
 

 task run_phase(uvm_phase phase);
  phase.raise_objection(this);
   s.start(envh.agth.seqrh);
   #30;
   phase.drop_objection(this);
 endtask
endclass
