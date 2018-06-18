
// Some notes for the control signals:
// **beq, bne, jump** `MemtoReg` must be set to `0` not `x`, otherwise hazard
// unit causes the fetch and decode pipeline registers to be disabled!
// `RegDst` possibly similar sitution because it causes `WriteReg` to be `x`
// and then it cannot be used by hazard detector! (RegDst is a maybe)
module maindec (
                  op,
                  func,
                  eq_ne,
                  regwrite,
                  memtoreg,
                  memread,
                  memwrite,
                  regdst,
                  alu_src,
                  alu_mid,
                  start_mult,
                  mult_sign,
                  outselect,
                  jump,
                  beq,
                  bne,
                  se_ze
               );
//--Input Ports-------------------
input [5:0]    op;
input [5:0]    func;
input          eq_ne;
//--Output Ports------------------
output         regwrite;
output         memtoreg;
output         memread;
output         memwrite;
output         regdst;
output         alu_src;
output [2:0]   alu_mid;
output         start_mult;
output         mult_sign;
output [1:0]   outselect;
output         jump;
output         beq;
output         bne;
output         se_ze;

parameter RTYPE = 0; // OPCODE's
parameter JUMP = 2;
parameter BEQ = 4;
parameter BNE = 5;
parameter ADDI = 8;
parameter ADDIU = 9;
parameter SLTI = 10;
parameter SLTIU = 11;
parameter ANDI = 12;
parameter ORI = 13;
parameter XORI = 14;
parameter LUI = 15;
parameter MUL = 28;
parameter LW = 35;
parameter SW = 43;
parameter MFHI = 16; // FUNC's
parameter MTHI = 17;
parameter MFLO = 18;
parameter MTLO = 19;
parameter MULT = 24;
parameter MULTU = 25;



parameter SUBCTRL_WIDTH = 17;

reg [SUBCTRL_WIDTH-1:0] md_control;
assign {             //
         se_ze,      //   [0] 1'b
         jump,       //   [1] 1'b
         beq,        //   [2] 1'b
         bne,        //   [3] 1'b
         regdst,     //   [4] 1'b
         alu_src,    //   [5] 1'b
         alu_mid,    //   [6] 3'b
                     //   [7] ---
                     //   [8] ---
         start_mult, //   [9] 1'b
         mult_sign,  //  [10] 1'b
         outselect,  //  [11] ---
         memread,    //  [13] 1'b
         memwrite,   //  [14] 1'b
         regwrite,   //  [15] 1'b
         memtoreg    //  [16] 1'b
                     //
       } = md_control;

//--Asynchronous----------------
always @ (*) begin
   case (op)               //17'b01234567890123456
      JUMP:    md_control <= 17'b01000000000000000;
      BEQ:     md_control <= 17'b00100000000000000;
      BNE:     md_control <= 17'b00010000000000000;
      ADDI:    md_control <= 17'b10000100000000010;
      ADDIU:   md_control <= 17'b10000100000000010;
      SLTI:    md_control <= 17'b10000110100000010;
      SLTIU:   md_control <= 17'b10000110100000010;
      ANDI:    md_control <= 17'b00000101000000010;
      ORI:     md_control <= 17'b00000101100000010;
      XORI:    md_control <= 17'b00000110000000010;
      LUI:     md_control <= 17'b00000000000010010;
      LW:      md_control <= 17'b00000100000001011;
      SW:      md_control <= 17'b00000100000000100;
      RTYPE: begin
         case (func)
            MFHI:    md_control <= 17'b00001000000110010;
            MFLO:    md_control <= 17'b00001000000100010;
            MULT:    md_control <= 17'b00000000011000000;
            MULTU:   md_control <= 17'b00000000010000000;
            default: md_control <= 17'b00001011100000010;
         endcase
      end
      default: md_control <= 17'b00000000000000000;
   endcase
end

endmodule

