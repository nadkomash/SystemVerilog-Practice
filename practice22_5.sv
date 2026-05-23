module p_typedef1;
  typedef shortint unsigned u_shorti;
  typedef enum {RED, YELLOW, GREEN} e_light;
  typedef bit [7:0] ubyte;

  initial begin
    u_shorti 	data = 32'hface_cafe;
    e_light 	light = GREEN;
    ubyte 		cnt = 8'hFF;

    $display ("light=%s data=0x%0h cnt=%0d", light.name(), data, cnt);
    light.


  end
endmodule