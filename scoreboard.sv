class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)

 uvm_analysis_imp #(trans,scoreboard) rec;

 trans tr;

  function new(string name = "scoreboard", uvm_component parent = null);
    super.new(name, parent);
    rec = new("rec", this);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
    tr = trans::type_id::create("tr");
  endfunction

  virtual function void write(input trans t);
   tr=t;
   `uvm_info("SCO",$sformatf("Data rcvd from Monitor a : %0d  , b : %0d, c : %0d, d : %0d, sel : %0d and y : %0d", tr.i0,tr.i1,tr.i2,tr.i3,tr.sel,tr.y), UVM_NONE);
   
   case(tr.sel)
        2'b00:begin if(tr.y == tr.i0) `uvm_info("SB","test_pass",UVM_NONE);end
        2'b01:begin if(tr.y == tr.i1)`uvm_info("SB","test_pass",UVM_NONE);end
        2'b10:begin if(tr.y == tr.i2)`uvm_info("SB","test_pass",UVM_NONE);end
        2'b11:begin if(tr.y == tr.i3)`uvm_info("SB","test_pass",UVM_NONE);end
     endcase
   endfunction

endclass