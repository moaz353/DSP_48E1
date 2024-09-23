<h2 align="center">DSP_48E1</h2> 


## Overview 
### This project demonstrates the use of the DSP48E1 block for efficient digital signal processing (DSP) operations in FPGA designs. The DSP48E1 block is utilized to perform high-speed arithmetic operations, such as addition, multiplication, and more, which are common in DSP applications.

### The project includes source files for the design and testbenches for verification. It is intended to provide an example of how to effectively use the DSP48E1 block in hardware design.


## Description 
### This project aims to demonstrate the use of the DSP48E1 block in FPGA designs for performing arithmetic operations efficiently. To provide a detailed explanation of how the block works and how it can be applied in digital signal processing designs, the PDF overview contains additional information about the project design, implementation steps, and the testing environment. For more details about the project and how to use it, you can refer to the detailed PDF document available at the following link: [`DSP48E1.pdf`](https://github.com/moaz353/DSP_48E1/blob/main/DSP48E1.pdf)

### Three images have been included to illustrate the project’s structure. These images reflect the engineering design and the connections used, aiding in a better understanding of the architecture. You can refer to the attached images for a comprehensive view of how the various components in the project are organized. 
### [`Snippet_1`](https://github.com/moaz353/DSP_48E1/blob/main/DSP48E1_snippet_1.png)  , [`Snippet_2`](https://github.com/moaz353/DSP_48E1/blob/main/DSP48E1_snippet_2.png)  and [`Snippet_3`](https://github.com/moaz353/DSP_48E1/blob/main/DSP48E1_snippet_3.png) ; 



## Design and Testbench 
### The project is organized such that each part of the design has its own dedicated file, along with a specific Testbench file for testing that part. This organization improves the clarity of the structure, making it easier to analyze and test each module independently.

### 1) [`TOP_module`](https://github.com/moaz353/DSP_48E1/tree/main/___TOP_module___) ;
 
### 2) [`Dual A , D and Pre adder reg`](https://github.com/moaz353/DSP_48E1/tree/main/__Dual_A_D_Pre_adder_reg__) ; 

### 3) [`Dual B register`](https://github.com/moaz353/DSP_48E1/tree/main/__Dual_B_Register__) ;

### 4 ) [`ALU`](https://github.com/moaz353/DSP_48E1/tree/main/__ALU__) ; 

### 5 ) [`CIN_mux`](https://github.com/moaz353/DSP_48E1/tree/main/__CIN_mux__) ; 

### 6 ) [`X_mux`](https://github.com/moaz353/DSP_48E1/tree/main/__X_mux__) ; 

### 7 ) [`Y_mux`](https://github.com/moaz353/DSP_48E1/tree/main/__Y_mux__) ;

### 8 ) [`Z_mux`](https://github.com/moaz353/DSP_48E1/tree/main/__Z_mux__) ;  

### 9 ) [`MULT_25x18`](https://github.com/moaz353/DSP_48E1/tree/main/__MULT_25x18__);

### 10 ) [`DFF`](https://github.com/moaz353/DSP_48E1/tree/main/__DFF__) ;

### 11 ) [`mux_2x1`](https://github.com/moaz353/DSP_48E1/tree/main/__mux_2x1__) ; 

## Simulation , RTL elaboration ,  Synthesis and Impl  

### Let's review the design results together, where the `questa sim` was used for simulation and `Vivado` was utilized for the synthesis and implementation processes.

### [`Simulation results`](https://github.com/moaz353/DSP_48E1/tree/main/___TOP_module___/Simulation)  ; 

### [`RTL elaboration`](https://github.com/moaz353/DSP_48E1/tree/main/___TOP_module___/RTL_elaboration) ; 

### [`Synthesis results`](https://github.com/moaz353/DSP_48E1/tree/main/___TOP_module___/Synthesis)    ; 

### [`Impl results`](https://github.com/moaz353/DSP_48E1/tree/main/___TOP_module___/Impl)              ; 

## THX ; 
