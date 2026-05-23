
/*
module p_geresh;
  reg [7:0]  m_var1;
  reg [15:0] m_var2;

  initial begin

    //Enhanced ' literal
    m_var1 = '1;
    m_var2 = '1;
    $display("m_var1=0x%0h  m_var2=0x%0h", m_var1, m_var2);
    // This does not work - Radix must be specified !
    //m_var1 = 'F0;
    //m_var2 = 'cafe;
  end
endmodule

module p_floats;
  real  pi;        // Declared to be of type real
  real  freq;

  initial begin;
    pi   = 3.14;    // Store floating point number
    freq = 1e6; 	// Store exponential number

    $display ("Value of pi = %f", pi);
    $display ("Value of pi = %0.3f", pi);
    $display ("Value of freq = %0d", freq);
  end
endmodule
 */

/*
module p_bytes;
   byte           m_var_s;      // By default signed, and can represent positive and negative numbers

  initial begin

    #10 m_var_s  = 0;           // assign 0
    #20 m_var_s  = 2**7 - 1; 	// assign 127
    #30 m_var_s  = 2**7;        // assign 128
    #40 m_var_s  = 2**8 - 1;    // assign 255
  end

  initial
    $monitor("[%0t] m_var_s = 'd%0d  (0x%0h)", $time, m_var_s, m_var_s);
endmodule
 */   
 

module p_signed_unsigned_bytes;
	  byte    	s_byte;   // By default byte is signed
  byte unsigned  	u_byte;   // Byte is set to unsigned

  initial begin
    $display ("Size s_byte=%0d, u_byte=%0d", $bits(s_byte), $bits(u_byte));

    // Assign the "assumed" maximum value to both variables
    #1 s_byte = 'h7F;
       u_byte = 'h7F;

    // Increment by 1, and see that s_byte rolled over to negative because
    // byte is signed by default. u_byte keeps increasing because it is
    // unsigned and can go upto 255
    #1 s_byte += 1;
       u_byte += 1;

    // Assign 255 (8'hFF) to u_byte -> this is the max value it can hold
    #1 u_byte = 'hFF;

    // Add 1 and see that it rolls over to 0
    #1 u_byte += 1;
  end

  initial begin
    $monitor ("[%0t ns] s_byte=%0d u_byte=%0d", $time, s_byte, u_byte);
  end
endmodule
