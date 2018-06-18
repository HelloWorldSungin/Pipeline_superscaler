//
// file: controller.v
//
module controller (
                    op,
                    func,
                    eq_ne,
                    regwrite,
                    memtoreg,
                    memread,
                    memwrite,
                    regdst,
                    alusrc,
                    aluctrl,
                    startmult,
                    multsign,
                    outselect,
                    branch,
                    pcsrc,
                    se_ze
                  );
//--Input Ports------------------------------
input [5:0]     op;
input [5:0]     func;
input           eq_ne;
//--Output Ports----------
output          regwrite;  // WB  control signals
output          memtoreg;  // ------------------
output [1:0]    outselect;    // MEM control signals
output          memread;   // ------------------
output          memwrite;  // ------------------
output          regdst;    // EXE control signals
output          alusrc;    // ------------------
output [3:0]    aluctrl;   // ------------------
output          startmult; // ------------------
output          multsign;  // ------------------
output          branch;    // ID  control signals
output [1:0]    pcsrc;     // ------------------
output          se_ze;     // ------------------
//--Internal Wires---------
wire jump;
wire beq;
wire bne;
wire branch_taken;
wire [2:0] ALU_Mid;

//--Wire Assignments---------
assign branch = beq | bne;
assign branch_taken = (beq & eq_ne) ^ (~eq_ne & bne);
assign pcsrc = {jump, branch_taken};


// MAIN_DECODER:
//
maindec main_decoder (
                        .op(op),
                        .func(func),
                        .eq_ne(eq_ne),
                        .regwrite(regwrite),
                        .memtoreg(memtoreg),
                        .memread(memread),
                        .memwrite(memwrite),
                        .regdst(regdst),
                        .alu_src(alusrc),
                        .alu_mid(ALU_Mid),
                        .start_mult(startmult),
                        .mult_sign(multsign),
                        .outselect(outselect),
                        .se_ze(se_ze),
                        .beq(beq),
                        .bne(bne),
                        .jump(jump)
                     );

// ALU_DECODER: generates the control signal `aluctrl[3:0]` that
// 
ALUdec alu_decoder (
                     .Func(func),
                     .ALU_Mid(ALU_Mid),
                     .ALU_Op(aluctrl)
                   );

endmodule

