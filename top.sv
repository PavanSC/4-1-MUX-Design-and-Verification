module top();

import uvm_pkg::*;
import mux_pkg::*;

mux_if intf();

 mux DUT(.i0(intf.i0),.i1(intf.i1),.i2(intf.i2),.i3(intf.i3),.sel(intf.sel),.y(intf.y));


 initial begin

 uvm_config_db#(virtual mux_if)::set(null,"*","mux_if",intf);
 run_test();
 end

endmodule