`timescale 1ns / 1ps
module CYBERcobra (
  input           CLK,
  input           rst,
  input   [31:0]  IN,
  output  [31:0]  OUT
);

// ваш код с подключенными IM, RF и ALU

reg [7:0] pc;
wire pc_flag;
reg [7:0] pc_out; 
wire [31:0] n;
wire [31:0] rd1, rd2;
wire [31:0] Result;
wire Flag;
reg [31:0] wd;
wire [31:0] se;
wire [31:0] alu;

// считывание команды
InstructionMemory IM(
                   .A(pc),
                   .RD(n)
);

//запись/считывание с регистрового файла
RegisterFile RG(
           .clk(CLK),
           .A1(n[22:18]),
           .A2(n[17:13]),
           .A3(n[4:0]),
           .WD(wd),
           .WE(n[28] | n[29]),
           .RD1(rd1),
           .RD2(rd2) );  

//вычисление                
alu ALU(
           .A(rd1),
           .B(rd2),
           .ALUOp(n[27:23]),
           .Result(alu),
           .Flag(flag) ); 

assign se = {{9{n[27]}}, n[27:5]};
assign pc_flag = (flag & n[30]) | n[31];

always@* begin
    case (n[29:28])
        'b01: wd = IN;
        'b10: wd = se;
        'b11: wd = alu;
        default: wd = 'b0;
endcase
end

always@* begin
case (pc_flag)    
    'b0: pc_out = 1;
    'b1: pc_out = n[12:5];    
endcase
end

//program counter
always @(posedge CLK)
    if(rst)
        pc = 0;
    else pc = pc + pc_out;    
                                               
assign OUT = rd1;

endmodule