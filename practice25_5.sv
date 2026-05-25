module p_coverage; 

  // Forward declaration of the class so the covergroup knows it exists
  typedef class myTrns;

  // 1. Define the covergroup OUTSIDE the class
  covergroup Cg1 (myTrns obj);
    coverpoint obj.mode {
      bins featureA   = { 0 };
      bins featureB   = { [1:3
      ] };   
      bins common []  = { [4:15] }; // 4-bit max is 15
      bins reserve    = default;
    }
    coverpoint obj.key;
  endgroup

  class myTrns;
    rand bit [3:0]  mode;
    rand bit [1:0]  key;

    // Handle to the covergroup
    Cg1 cg_inst;

    // Constructor
    function new();
      // Pass 'this' class instance into the covergroup constructor
      cg_inst = new(this);
    endfunction

    function void display();
      $display("[%0tns] mode = 0x%0h, key = 0x%0h", $time, mode, key);
    endfunction
  endclass 

  initial begin
    myTrns tr;
    tr = new(); 

    $display("--- Starting Randomization Loop ---");
    
    for (int i = 0; i < 10; i++) begin
      #10; 
      if (tr.randomize()) begin
        // Since the covergroup is outside the class, we sample it manually here
        tr.cg_inst.sample();
        tr.display();
      end else begin
        $error("Randomization failed!");
      end
    end

    $display("\n--- Final Coverage Results ---");
    $display("Covergroup Cg1 Coverage = %0.2f %%", tr.cg_inst.get_inst_coverage());
  end

endmodule
