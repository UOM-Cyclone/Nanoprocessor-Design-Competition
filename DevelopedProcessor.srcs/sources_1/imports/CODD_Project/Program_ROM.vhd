----------------------------------------------------------------------------------
-- Company: 
-- Engineer: DE SILVA A D D T
-- 
-- Create Date: 04/13/2024 10:58:33 AM
-- Design Name: 
-- Module Name: Program_ROM - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use ieee.numeric_std.all; 

entity Program_ROM is
    Port ( Memo_sel : in STD_LOGIC_VECTOR (3 downto 0);
           RomSel : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction :OUT STD_LOGIC_VECTOR (12 DOWNTO 0);
           Clk : in STD_LOGIC;
           ResetOut : out STD_LOGIC);    
end Program_ROM;

architecture Behavioral of Program_ROM is

type instructions is array (0 to 15) of std_logic_vector(12 downto 0);

signal prevRomSel, xorResult : STD_LOGIC_VECTOR(2 downto 0);
signal changed : STD_LOGIC;
signal currentROM : instructions;

signal PROM0 : instructions := (
--Program to find sum of 1 to 3
    --IIIRR1RR2IVAL  
     "0100010000011", --0  MOVI R1 , 3  
     "0100100000001", --1  MOVI R2 , 1
     "0101110000000", --2  MOVI R7 , 0
     "0001110010000", --3  ADD R7 , R1
     "1111110000000", --4  DISP R7
     "0010010100000", --5  SUB R1 , R2
     "0110010001111", --6  JZR R1 , 15
     "0110000000011", --7  JZR R0 , 3
     "0000000000000", --8  NULL
     "0000000000000", --9  NULL
     "0000000000000", --10 NULL
     "0000000000000", --11 NULL
     "0000000000000", --12 NULL
     "0000000000000", --13 NULL
     "0000000000000", --14 NULL
     "0000000000000"  --15 NULL
);

signal PROM1 : instructions := (
--Program to count 10 to 0
    --IIIRR1RR2IVAL  
     "0101110001011", --0  MOVI R7 , 11  
     "0100100000001", --1  MOVI R2 , 1
     "0011110100000", --2  SUB R7 , R2
     "1111110000000", --3  DISP R7
     "0111110001111", --4  JZR R7 , 15
     "0110000000010", --5  JZR R0 , 2
     "0000000000000", --6  NULL
     "0000000000000", --7  NULL
     "0000000000000", --8  NULL
     "0000000000000", --9  NULL
     "0000000000000", --10 NULL
     "0000000000000", --11 NULL
     "0000000000000", --12 NULL
     "0000000000000", --13 NULL
     "0000000000000", --14 NULL
     "0000000000000"  --15 NULL
);

signal PROM2 : instructions := (
--Program
    --IIIRR1RR2IVAL  
     "0100010000001", --0  MOVI R1 , 1  
     "0101110000001", --1  MOVI R7 , 1
     "0001110010000", --2  ADD R7 , R1
     "0001110010000", --3  ADD R7 , R1
     "0001110010000", --4  ADD R7 , R1
     "0001110010000", --5  ADD R7 , R1
     "0001110010000", --6  ADD R7 , R1
     "0001110010000", --7  ADD R7 , R1
     "0001110010000", --8  ADD R7 , R1
     "0001110010000", --9  ADD R7 , R1
     "0001110010000", --10 ADD R7 , R1
     "0110000001111", --11 JZR R0 , 15
     "0000000000000", --12 NULL
     "0000000000000", --13 NULL
     "0000000000000", --14 NULL
     "0000000000000"  --15 NULL
);

signal PROM3 : instructions := (
--Program to find factorial of 3
    --IIIRR1RR2IVAL  
     "0100110000011", --0  MOVI R3 , 3  
     "0101110000001", --1  MOVI R7 , 1
     "0100100000001", --2  MOVI R2 , 1
     "1011110110000", --3  MUL R7 , R3
     "1111110000000", --4  DISP R7
     "0010110100000", --5  SUB R3 , R2
     "0110110001111", --6  JZR R3 , 15
     "0110000000011", --7  JZR R0 , 4
     "0000000000000", --8  NULL
     "0000000000000", --9  NULL
     "0000000000000", --10 NULL
     "0000000000000", --11 NULL
     "0000000000000", --12 NULL
     "0000000000000", --13 NULL
     "0000000000000", --14 NULL
     "0000000000000"  --15 NULL
);

signal PROM4 : instructions := (
--Program to find the 3rd power of 2
    --IIIRR1RR2IVAL  
     "0100110000011", --0  MOVI R3 , 3  
     "0101110000001", --1  MOVI R7 , 1
     "1101110110111", --2  SHIFTL R7 , R3
     "1111110000000", --3  DISP R7
     "0110000001111", --4  JZR R0 , 15
     "0000000000000", --5  NULL
     "0000000000000", --6  NULL
     "0000000000000", --7  NULL
     "0000000000000", --8  NULL
     "0000000000000", --9  NULL
     "0000000000000", --10 NULL
     "0000000000000", --11 NULL
     "0000000000000", --12 NULL
     "0000000000000", --13 NULL
     "0000000000000", --14 NULL
     "0000000000000"  --15 NULL
);

signal PROM5 : instructions := (
--Program to find modulus and remain
    --IIIRR1RR2IVAL  
     "0100010001010", --0  MOVI R1 , 10  
     "0100100000011", --1  MOVI R2 , 3
     "0101110000000", --2  MOVI R7 , 0
     "0101010000001", --3  MOVI R5 , 1
     "0101100000011", --4  MOVI R6 , 3
     "0010010100000", --5  SUB R1 , R2
     "0001111010000", --6  ADD R7 , R5
     "1001100010001", --7  CMP R6 > R1
     "0111100000011", --8  JZR R6 , 3
     "0110000001110", --9  JZR R0 , 14
     "0000000000000", --10 NULL
     "0000000000000", --11 NULL
     "0000000000000", --12 NULL
     "0000000000000", --13 NULL
     "1111110000000", --14 DISP R7
     "1110010000000"  --15 DISP R1
);

signal PROM6 : instructions := (
--Program to find  whether a number is even or no
    --IIIRR1RR2IVAL  
     "0100010001010", --0  MOVI R1 , 10  
     "0100100000010", --1  MOVI R2 , 2
     "0101010000001", --2  MOVI R5 , 1
     "0101000000010", --3  MOVI R4 , 2
     "0010010100000", --4  SUB R1 , R2
     "0110010001110", --5  JZR R1 , 14
     "1001000010001", --6  CMP R4 > R1 
     "0111000000011", --7  JZR R4 , 3
     "1110000000000", --8  DISP R0
     "0110000001111", --9  JZR R0 , 15
     "0000000000000", --10 NULL
     "0000000000000", --11 NULL
     "0000000000000", --12 NULL
     "0000000000000", --13 NULL
     "1111010000000", --14 DISP R5
     "0000000000000"  --15 NULL
);

begin

process(Clk)
begin
    if rising_edge(Clk) then
        prevRomSel <= RomSel;
    end if;
end process;

changed <= '0' when prevRomSel = RomSel else '1';

process(changed)
begin
    if rising_edge(changed) then
        ResetOut <= '1';
    end if;
    
    if falling_edge(changed) then
        ResetOut <= '0';
    end if;
end process;

--process (RomSel) begin
--    changed <= '1';
--end process;

--process (changed, Clk) begin
--    if(rising_edge(Clk) and changed = '1') then
--        ResetOut <= '1';
--    end if;
--    if falling_edge(Clk) then
--        ResetOut <= '0';
--    end if;
--    changed <= '0';
--end process;

process(RomSel) begin
    case RomSel is
        when "000" =>
            currentROM <= PROM0;
        when "001" =>
            currentROM <= PROM1;
        when "010" =>
            currentROM <= PROM2;
        when "011" =>
            currentROM <= PROM3;
        when "100" =>
            currentROM <= PROM4;
        when "101" =>
            currentROM <= PROM5;
        when "110" =>
            currentROM <= PROM6;
        when others =>
            currentROM <= PROM0;
    end case;
end process;

Instruction <= currentROM(to_integer(unsigned(Memo_sel)));

end Behavioral;

