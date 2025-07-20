----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 05:08:55
-- Design Name: 
-- Module Name: Processor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Processor is
    Port ( Clk : in STD_LOGIC;
           RomSel: in STD_LOGIC_VECTOR (2 downto 0);
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           SegOn : out STD_LOGIC_VECTOR (3 downto 0);
           SevenSegOut : out STD_LOGIC_VECTOR (6 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Negative : out STD_LOGIC;
           Res : in STD_LOGIC);
end Processor;

architecture Behavioral of Processor is

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component Register_Bank
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           RegEn : in STD_LOGIC_VECTOR (2 downto 0);
           Reg_in : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_0_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_1_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_2_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_3_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_4_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_5_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_6_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_7_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Eight_way_4_bit_Mux
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component ALU
    Port ( input_1 : in STD_LOGIC_VECTOR (3 downto 0);
           input_2 : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Sign : out STD_LOGIC;
           selector : in STD_LOGIC_VECTOR (3 downto 0));
end component;

component Two_way_4_bit_Mux
    Port ( I0 : IN STD_LOGIC_VECTOR (3 downto 0);
           I1 : IN STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Ins_decoder
    Port ( Ins : in STD_LOGIC_VECTOR (12 downto 0);
           RegVal : in STD_LOGIC_VECTOR (3 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSel : out STD_LOGIC;
           setDisplay : out STD_LOGIC;
           ImdVal : out STD_LOGIC_VECTOR (3 downto 0);
           RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel2 : out STD_LOGIC_VECTOR (2 downto 0);
           OpSelector : out STD_LOGIC_VECTOR (3 downto 0);
           JumpFlag : out STD_LOGIC;
           JumpAdd : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Adder_4_bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC);
end component;

component Program_ROM
    Port ( Memo_sel : in STD_LOGIC_VECTOR (3 downto 0);
           RomSel : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction :OUT STD_LOGIC_VECTOR (12 DOWNTO 0);
           Clk : in STD_LOGIC;
           ResetOut : out STD_LOGIC);
end component;

component Program_Counter
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Input : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component SevenSeg
    Port ( changeVal : in STD_LOGIC;
           Clk : in STD_LOGIC;
           val : in STD_LOGIC_VECTOR (3 downto 0);
           SegVal : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end Component;

signal slw_clk : STD_LOGIC;

--Control Signals
Signal RegSel, AU_in_1_sel, AU_in_2_sel : STD_LOGIC_VECTOR(2 downto 0);
Signal JumpAddress, MemSel, PC_plus_1, PC_in, opSelector : STD_LOGIC_VECTOR(3 downto 0);
Signal Substract, LoadSel, JumpFlag, innerRes, Reset, displayTrigger : STD_LOGIC;
--Data Signals
    --RegisterBank
    Signal DataToLoad, Reg_0_Data, Reg_1_Data, Reg_2_Data, Reg_3_Data, Reg_4_Data, Reg_5_Data, Reg_6_Data, Reg_7_Data : STD_LOGIC_VECTOR(3 downto 0);
    --AU
    Signal AU_in_1, AU_in_2, AU_out : STD_LOGIC_VECTOR(3 downto 0);
    --Instruction Decoder
    Signal imd_value : STD_LOGIC_VECTOR(3 downto 0);
    Signal I : STD_LOGIC_VECTOR(12 downto 0);
--Seven Segment Display    
type rom_type is array (0 to 15) of std_logic_vector(6 downto 0);   
    signal sevenSegment_ROM : rom_type := (
    --GFEDCBA
     "1000000",
     "1111001",
     "0100100",
     "0110000",
     "0011001",
     "0010010",
     "0000010",
     "1111000",
     "0000000",
     "0010000",
     "0001000",
     "0000011",
     "1000110",
     "0100001",
     "0000110",
     "0001110"
    );
begin

SlowClock : Slow_Clk
    port map(Clk, slw_clk);

RegBank : Register_Bank
    port map(slw_clk, Reset, RegSel, DataToLoad, Reg_0_Data, Reg_1_Data, Reg_2_Data, Reg_3_Data, Reg_4_Data, Reg_5_Data, Reg_6_Data, Reg_7_Data);

AU_in_1_selector : Eight_way_4_bit_Mux
    port map(Reg_0_Data, Reg_1_Data, Reg_2_Data, Reg_3_Data, Reg_4_Data, Reg_5_Data, Reg_6_Data, Reg_7_Data, AU_in_1_sel, AU_in_1);

AU_in_2_selector : Eight_way_4_bit_Mux
    port map(Reg_0_Data, Reg_1_Data, Reg_2_Data, Reg_3_Data, Reg_4_Data, Reg_5_Data, Reg_6_Data, Reg_7_Data, AU_in_2_sel, AU_in_2);
    
ALU_0 : ALU
    port map(AU_in_1, AU_in_2, AU_out, Overflow, Zero, Negative, opSelector);
    
Load_selector : Two_way_4_bit_Mux
    port map(imd_value, AU_out, LoadSel, DataToLoad);

InstructionDecoder : Ins_decoder
    port map(I, AU_in_1, RegSel, LoadSel, displayTrigger, imd_value, AU_in_1_sel, AU_in_2_sel, opSelector, JumpFlag, JumpAddress);

PC_increaser : Adder_4_bit
    port map(MemSel, '0', PC_plus_1);   --C_out is not connected
    
NextMemoryAddressSelector : Two_way_4_bit_Mux
    port map(PC_plus_1, JumpAddress, JumpFlag, PC_in);
    
ProgramROM : Program_ROM
    port map(MemSel, RomSel, I, slw_clk, innerRes);
    
PC : Program_Counter
    port map(slw_clk, Reset, PC_in, MemSel);

Display: SevenSeg
    port map(displayTrigger, Clk, AU_in_1, SevenSegOut, SegOn);
    
LED <= Reg_7_Data;
Reset <= Res OR innerRes;

end Behavioral;
