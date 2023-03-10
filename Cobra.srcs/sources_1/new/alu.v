`include "ALUOp.v"
//`define ADD 5'b00000
//`define SUB 5'b01000
//`define SLL 5'b00001
//`define SLT 5'b00010
//`define SLTU 5'b00011
//`define XOR 5'b00100
//`define SRL 5'b00101
//`define SRA 5'b01101
//`define OR 5'b00110
//`define AND 5'b00111
//`define BEQ 5'b11000
//`define BNE 5'b11001
//`define BLT 5'b11100
//`define BGE 5'b11101
//`define BLTU 5'b11110
//`define BGEU 5'b11111
`timescale 1ns / 1ps
module alu (
  input       [31:0]  A,
  input       [31:0]  B,
  input       [4:0]   ALUOp,
  output  reg         Flag,   
  output  reg [31:0]  Result  
);                            

  always @ * begin               
    case (ALUOp)
      `ADD: 
            begin
                Result = A + B;
                Flag = 0;
            end
      `SUB: 
            begin;
                Result = A - B;
                Flag = 0;
            end
      `SLL: 
            begin
                Result = A << B;
                Flag = 0;
            end
      `SLT: 
            begin
                Result = $signed(A) < $signed(B);
                Flag = 0;
            end
      `SLTU: 
            begin
                Result = A < B;
                Flag = 0;
            end
      `XOR: 
            begin
                Result = A ^ B;
                Flag = 0;
            end
      `SRL: 
            begin
                Result = A >> B;
                Flag = 0;
            end
      `SRA: 
            begin
                Result = $signed(A) >>> $signed(B);
                Flag = 0;
            end
      `OR: 
            begin
                Result = A | B;
                Flag = 0;
            end
      `AND: 
            begin
                Result = A & B;
                Flag = 0;
            end
      `BEQ: 
            begin
                Flag = (A == B);
                Result = 0;
            end
      `BNE: 
            begin
                Flag = (A != B);
                Result = 0;
            end
      `BLT: 
            begin
                Flag = $signed(A) < $signed(B);
                Result = 0;
            end
      `BGE: 
            begin
                Flag = $signed(A) >= $signed(B);
                Result = 0;
            end
      `BLTU: 
            begin
                Flag = (A < B);
                Result = 0;
            end
      `BGEU: 
            begin
                Flag = (A >= B);
                Result = 0;
            end
       default: 
            begin
                Flag = 0;
                Result = 0;
            end
    endcase
 end

endmodule