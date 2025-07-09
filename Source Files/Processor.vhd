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
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           SegOn : out STD_LOGIC_VECTOR (3 downto 0);
           SevenSeg : out STD_LOGIC_VECTOR (6 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
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

component adder_subtractor
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;  --To substract -> 1
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

component Two_way_4_bit_Mux
    Port ( I0 : IN STD_LOGIC_VECTOR (3 downto 0);
           I1 : IN STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Ins_decoder
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
           RegVal : in STD_LOGIC_VECTOR (3 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSel : out STD_LOGIC;
           ImdVal : out STD_LOGIC_VECTOR (3 downto 0);
           RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel2 : out STD_LOGIC_VECTOR (2 downto 0);
           isSub : out STD_LOGIC;
           JumpFlag : out STD_LOGIC;
           JumpAdd : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Adder_3_bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           --B : +1
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end component;

component Two_way_3_bit_Mux
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           O : OUT STD_LOGIC_VECTOR (2 downto 0));
end component;

component Program_ROM
    Port ( Memo_sel : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction :OUT STD_LOGIC_VECTOR (11 DOWNTO 0));
end component;

component Program_Counter
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Input : in STD_LOGIC_VECTOR (2 downto 0);
           Output : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal slw_clk : STD_LOGIC;

--Control Signals
Signal RegSel, AU_in_1_sel, AU_in_2_sel, JumpAddress, MemSel, PC_plus_1, PC_in : STD_LOGIC_VECTOR(2 downto 0);
Signal Substract, LoadSel, JumpFlag : STD_LOGIC;

--Data Signals
    --RegisterBank
    Signal DataToLoad, Reg_0_Data, Reg_1_Data, Reg_2_Data, Reg_3_Data, Reg_4_Data, Reg_5_Data, Reg_6_Data, Reg_7_Data : STD_LOGIC_VECTOR(3 downto 0);

    --AU
    Signal AU_in_1, AU_in_2, AU_out : STD_LOGIC_VECTOR(3 downto 0);

    --Instruction Decoder
    Signal imd_value : STD_LOGIC_VECTOR(3 downto 0);
    Signal I : STD_LOGIC_VECTOR(11 downto 0);

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
    port map(slw_clk, Res, RegSel, DataToLoad, Reg_0_Data, Reg_1_Data, Reg_2_Data, Reg_3_Data, Reg_4_Data, Reg_5_Data, Reg_6_Data, Reg_7_Data);

AU_in_1_selector : Eight_way_4_bit_Mux
    port map(Reg_0_Data, Reg_1_Data, Reg_2_Data, Reg_3_Data, Reg_4_Data, Reg_5_Data, Reg_6_Data, Reg_7_Data, AU_in_1_sel, AU_in_1);

AU_in_2_selector : Eight_way_4_bit_Mux
    port map(Reg_0_Data, Reg_1_Data, Reg_2_Data, Reg_3_Data, Reg_4_Data, Reg_5_Data, Reg_6_Data, Reg_7_Data, AU_in_2_sel, AU_in_2);

AU : adder_subtractor
    port map(AU_in_1, AU_in_2, Substract, AU_out, Overflow, Zero);
    
Load_selector : Two_way_4_bit_Mux
    port map(imd_value, AU_out, LoadSel, DataToLoad);

InstructionDecoder : Ins_decoder
    port map(I, AU_in_1, RegSel, LoadSel, imd_value, AU_in_1_sel, AU_in_2_sel, Substract, JumpFlag, JumpAddress);

PC_increaser : Adder_3_bit
    port map(MemSel, '0', PC_plus_1);   --C_out is not connected
    
NextMemoryAddressSelector : Two_way_3_bit_Mux
    port map(PC_plus_1, JumpAddress, JumpFlag, PC_in);
    
ProgramROM : Program_ROM
    port map(MemSel, I);
    
PC : Program_Counter
    port map(slw_clk, Res, PC_in, MemSel);
    
LED <= Reg_7_Data;
SegOn <= "1110";    --light on only the corner seven segment 
SevenSeg <= sevenSegment_ROM(to_integer(unsigned(Reg_7_Data)));

end Behavioral;
