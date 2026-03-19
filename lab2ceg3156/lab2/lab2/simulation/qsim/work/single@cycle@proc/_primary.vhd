library verilog;
use verilog.vl_types.all;
entity singleCycleProc is
    port(
        BranchOut       : out    vl_logic;
        GClock          : in     vl_logic;
        GReset          : in     vl_logic;
        WriteRegAdd     : out    vl_logic_vector(4 downto 0);
        ZeroOut         : out    vl_logic;
        MemWriteOut     : out    vl_logic;
        RegWriteOut     : out    vl_logic;
        DataMemOut      : out    vl_logic_vector(7 downto 0);
        InstructionOut  : out    vl_logic_vector(31 downto 0);
        MuxOut          : out    vl_logic_vector(7 downto 0);
        ValueSelect     : in     vl_logic_vector(2 downto 0);
        Operation       : out    vl_logic_vector(2 downto 0)
    );
end singleCycleProc;
