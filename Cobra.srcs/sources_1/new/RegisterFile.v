module RegisterFile (
    input clk,
    input [4:0] A1, // address
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD, 
    input WE, 
    output [31:0] RD1,
    output [31:0] RD2
 );
reg [31:0] RAM [0:31]; 
//initial $readmemb ("mem.txt", RAM);

assign RD1 = (A1 == 0) ? 0 : RAM[A1];
                      
assign RD2 = (A2 == 0) ? 0 : RAM[A2];
                      
always @ (posedge clk) 
    if (WE) RAM[A3] <= WD;
                                                      
endmodule