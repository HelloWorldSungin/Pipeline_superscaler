//
//
//

module dual_issue (
                    memread0,       memread1,
                    memwrite0,      memwrite1,
                    branch0,        branch1,
                    jump0,          jump1,
                    regwrite0,      regwrite1,
                    regdst0,        regdst1,
                    inst0_old,      inst1_old,
                    rs0,            rs1,
                    rt0,            rt1,
                    rd0,            rd1,
                    rewind,
                    inst0_new,      inst1_new
);
// Input Ports
input               memread0,       memread1;
input               memwrite0,      memwrite1;
input               branch0,        branch1;
input               jump0,          jump1;
input               regwrite0,      regwrite1;
input               regdst0,        regdst1;
input [31:0]        inst0_old,      inst1_old;
input [4:0]         rs0,            rs1;
input [4:0]         rt0,            rt1;
input [4:0]         rd0,            rd1;
// Output Ports
output reg          rewind;
output reg [31:0]   inst0_new,      inst1_new;

reg         saved_jump;
reg         saved_branch;
reg         saved_memrw;
reg         saved_regwrite;
reg         saved_regdst;
reg [31:0]  saved_inst;


initial begin
    rewind          <= 0;
    inst0_new       <= 0;
    inst1_new       <= 0;
    saved_jump      <= 0;
    saved_branch    <= 0;
    saved_memrw     <= 0;
    saved_regwrite  <= 0;
    saved_regdst    <= 0;
    saved_inst      <= 0;
end



always @ (*) begin
    if (saved_inst != 0) begin
        inst0_new = saved_inst;
        inst1_new = inst0_old;
        //try_inst = inst0_old;

        if (jump0 == 1 || branch0 == 1) begin
                inst1_new       = 0;
                rewind          = 1;
                saved_jump      = jump0;
                saved_branch    = branch0;
                saved_inst      = inst0_old;
        end

        else if (saved_memrw == 1) begin
                inst1_new       = 0;
                rewind          = 1;
                saved_memrw     = 0;
                saved_inst      = inst0_old;
        end

        else if (   saved_regwrite == 1
                    &&  saved_regdst == 0
                    &&  rs0 != 0
                    &&  rs0 == saved_inst[15:11]
        ) begin
                inst1_new       = 0;
                rewind          = 1;
                saved_regwrite  = regwrite0;
                saved_regdst    = regdst0;
                saved_inst      = inst0_old;
        end

        else if (   saved_regwrite == 1
                    &&  saved_regdst == 0
                    &&  rt0 != 0
                    &&  rt0 == saved_inst[15:11]
        ) begin
                inst1_new       = 0;
                rewind          = 1;
                saved_regwrite  = regwrite0;
                saved_regdst    = regdst0;
                saved_inst      = inst0_old;
        end
        else if (   saved_regwrite == 1
                    &&  saved_regdst == 1
                    && rs0 != 0
                    && rs0 == saved_inst[20:16]
        ) begin
                inst1_new       = 0;
                rewind          = 1;
                saved_regwrite  = regwrite0;
                saved_regdst    = regdst0;
                saved_inst      = inst0_old;
        end
        else if (   saved_regwrite == 1
                    &&  saved_regdst == 1
                    &&  regdst0 == 0
                    &&  rt0 != 0
                    &&  rt0 == saved_inst[20:16]
        ) begin
                inst1_new       = 0;
                rewind          = 1;
                saved_regwrite  = regwrite0;
                saved_regdst    = regdst0;
                saved_inst      = inst0_old;
        end

        else begin
                //saved_jump      = 0;
                //saved_branch    = 0;
                saved_regwrite  = 0;
                saved_regdst    = 0;
                saved_inst      = 0;
                rewind          = 0;
        end
    end
    else begin
        inst0_new = inst0_old;
        inst1_new = inst1_old;
        //try_inst = inst1_old;

        if (jump0 == 1 || branch0 == 1) begin
                inst1_new       = 0;
                rewind          = 1;
                saved_regwrite  = regwrite1;
                saved_regdst    = regdst1;
                saved_inst      = inst1_old;
        end

        else if (jump1 == 1 || branch1 == 1) begin
                inst1_new       = 0;
                rewind          = 1;
                saved_jump      = jump1;
                saved_branch    = branch1;
                saved_inst      = inst1_old;
        end

        else if (   (memread0 || memwrite0)
                    && (memread1 || memwrite1)
        ) begin
                inst1_new       = 0;
                rewind          = 1;
                saved_memrw     = 1;
                saved_inst      = inst1_old;
        end

        else if (   regwrite0 == 1
                    &&  regdst0 == 0
                    &&  rs1 != 0
                    &&  rs1 == rd0
        ) begin
                inst1_new       = 0;
                rewind          = 1;
                saved_regwrite  = regwrite1;
                saved_regdst    = regdst1;
                saved_inst      = inst1_old;
        end
        
        else if (   regwrite0 == 1
                    &&  regdst0 == 0
                    &&  regdst1 == 0
                    &&  rt1 != 0
                    &&  rt1 == rd0
        ) begin
                inst1_new       = 0;
                rewind          = 1;
                saved_regwrite  = regwrite1;
                saved_regdst    = regdst1;
                saved_inst      = inst1_old;
        end
        else if (   regwrite0 == 1
                    &&  regdst0 == 1
                    &&  rs1 != 0
                    &&  rs1 == rt0
        ) begin
                inst1_new       = 0;
                rewind          = 1;
                saved_regwrite  = regwrite1;
                saved_regdst    = regdst1;
                saved_inst      = inst1_old;
        end
        else if (   regwrite0 == 1
                    &&  regdst0 == 1
                    &&  regdst1 == 0
                    &&  rt1 != 0
                    &&  rt1 == rt0
        ) begin
                inst1_new       = 0;
                rewind          = 1;
                saved_regwrite  = regwrite1;
                saved_regdst    = regdst1;
                saved_inst      = inst1_old;
        end
        else begin
            saved_regwrite  = 0;
            saved_regdst    = 0;
            saved_inst      = 0;
            rewind          = 0;
            //inst1_new = try_inst;
        end
    end

end

endmodule