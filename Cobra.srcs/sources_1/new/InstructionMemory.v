module InstructionMemory (
    input [7:0] A,
    output [31:0] RD
 );
reg [31:0] RAM [0:255]; 
initial $readmemb ("IM.txt", RAM);                     
assign RD = RAM[A];                                                     
endmodule