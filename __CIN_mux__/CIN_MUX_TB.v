module tb_CARRYin;

    // Testbench signals
    reg clk;
    reg RSTALLCARTYIN;
    reg CECARRYIN;
    reg [2:0] carryinsel;
    reg carryin;
    reg MSB_Pcin;
    reg carrycascin;
    reg MSB_Pcin_n;
    reg carrycascout;
    reg MSB_P;
    reg Xnor_A24_B17;
    reg MSB_P_n;
    wire CIN;

    // Instantiate the module under test
    CARRYin uut (
        .clk(clk),
        .RSTALLCARTYIN(RSTALLCARTYIN),
        .CECARRYIN(CECARRYIN),
        .carryinsel(carryinsel),
        .carryin(carryin),
        .MSB_Pcin(MSB_Pcin),
        .carrycascin(carrycascin),
        .MSB_Pcin_n(MSB_Pcin_n),
        .carrycascout(carrycascout),
        .MSB_P(MSB_P),
        .Xnor_A24_B17(Xnor_A24_B17),
        .MSB_P_n(MSB_P_n),
        .CIN(CIN)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        RSTALLCARTYIN = 0;
        CECARRYIN = 0;
        carryinsel = 3'b000;
        carryin = 0;
        MSB_Pcin = 0;
        carrycascin = 0;
        MSB_Pcin_n = 0;
        carrycascout = 0;
        MSB_P = 0;
        Xnor_A24_B17 = 0;
        MSB_P_n = 0;

        // Apply reset
        RSTALLCARTYIN = 1;
        #10 RSTALLCARTYIN = 0;

        // Test case 1: Select input 0
        carryin = 1;
        carryinsel = 3'b000;
        #20;

        // Test case 2: Select input 1 (MSB_Pcin)
        MSB_Pcin = 1;
        carryinsel = 3'b001;
        #20;

        // Test case 3: Select input 4 (carrycascout)
        carrycascout = 1;
        carryinsel = 3'b100;
        #20;

        // Test case 4: Select input 6 (Xnor_A24_B17)
        Xnor_A24_B17 = 1;
        carryinsel = 3'b110;
        #20;

        // Additional test cases as needed...

        // Finish simulation
        $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time = %0t, carryinsel = %b, CIN = %b", $time, carryinsel, CIN);
    end

endmodule
