class agt extends uvm_agent;
`uvm_component_utils(agt)

mon monh;
drv drvh;
seqr seqrh;

function new(string name="agt",uvm_component parent=null);
 super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 monh=mon::type_id::create("monh",this);
 drvh=drv::type_id::create("drvh",this);
 seqrh=seqr::type_id::create("seqrh",this);
endfunction

virtual function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  drvh.seq_item_port.connect(seqrh.seq_item_export);
 endfunction

endclass