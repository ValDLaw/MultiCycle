`timescale 1ps/1ps

module testbench;
    reg clk;
	reg reset;
	wire [31:12] Instr;
	wire [3:0] ALUFlags;
	wire PCWrite;
	wire MemWrite;
	wire RegWrite;
	wire IRWrite;
	wire AdrSrc;
	wire [1:0] RegSrc;
	wire [1:0] ALUSrcA;
	wire [1:0] ALUSrcB;
	wire [1:0] ResultSrc;
	wire [1:0] ImmSrc;
	wire [1:0] ALUControl;

    controller cont(
        .clk(clk),
        .reset(reset),
        .Instr(Instr),
        .ALUFlags(ALUFlags),
        .PCWrite(PCWrite),
        .MemWrite(MemWrite),
        .RegWrite(RegWrite),
        .IRWrite(IRWrite),
        .AdrSrc(AdrSrc),
        .RegSrc(RegSrc),
        .ALUSrcA(ALUSrcA),
        .ALUSrcB(ALUSrcB),
        .ResultSrc(ResultSrc),
        .ImmSrc(ImmSrc),
        .ALUControl(ALUControl)
    );

    reg[31:0] PC;
    reg [31:0] RAM [63:0];
    reg [3:0] RAM2 [63:0];

    initial begin
        PC = 0;
        reset <= 1;
        #(5);
        reset <= 0;
    end

    assign Instr = RAM[PC[31:2]][31:12];
    assign AluFlags = RAM2[PC[31:1]][3:0];

    always begin
        clk <= 1;
        #(5);
        clk <= 1;
        #(5);
    end

    always @(posedge clk) begin
        #(20)
        if(Instr[27:26] == 2'b00)
            #(20);
        else if(Instr[27:26] == 2'b01) begin
            if(Instr[20] == 1'b1)
                #(30);
            else 
                #(20);
        end
        else 
            #(10);

        if(reset) begin
            PC <= 0;
        end
        else begin
            PC <= PC + 4;
        end
    end
    endmodule