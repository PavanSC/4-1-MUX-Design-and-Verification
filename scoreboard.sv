class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)

 uvm_analysis_imp #(trans,scoreboard) rec;

 trans tr;
 //trans tf;


covergroup fcov1;
  option.per_instance = 1;
  I0:coverpoint tr.i0{bins a1[4]={[0:3]};}

  I1:coverpoint tr.i1{bins b1[4]={[0:3]};}

  I2:coverpoint tr.i2{bins c1[4]={[0:3]};}

  I3:coverpoint tr.i3{bins a1[4]={[0:3]};}

  SEL:coverpoint tr.sel{bins a1[2]={[0:1]};}
  
  endgroup


  function new(string name = "scoreboard", uvm_component parent = null);
    super.new(name, parent);
    rec = new("rec", this);
    fcov1=new();
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
    tr = trans::type_id::create("tr");
    //tf = trans::type_id::create("tf");

  endfunction

  virtual function void write(input trans t);
   tr=t;
   fcov1.sample();
   //assert($cast(tr, t.clone()));  

   `uvm_info("SCO",$sformatf("Data rcvd from Monitor a : %0d  , b : %0d, c : %0d, d : %0d, sel : %0d and y : %0d", tr.i0,tr.i1,tr.i2,tr.i3,tr.sel,tr.y), UVM_NONE);
   
   case(tr.sel)
        2'b00:begin if(tr.y == tr.i0) `uvm_info("SB","test_pass",UVM_NONE);end
        2'b01:begin if(tr.y == tr.i1)`uvm_info("SB","test_pass",UVM_NONE);end
        2'b10:begin if(tr.y == tr.i2)`uvm_info("SB","test_pass",UVM_NONE);end
        2'b11:begin if(tr.y == tr.i3)`uvm_info("SB","test_pass",UVM_NONE);end
     endcase
   endfunction

endclass
