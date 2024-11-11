class env extends uvm_env;
`uvm_component_utils(env)

agt agth;
scoreboard sb;

function new(string name="env",uvm_component parent = null);
 super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 agth=agt::type_id::create("agth",this);
 sb=scoreboard::type_id::create("sb",this);
endfunction


function void connect_phase(uvm_phase phase);
 super.connect_phase(phase);
 agth.monh.m2s.connect(sb.rec);
endfunction

endclass