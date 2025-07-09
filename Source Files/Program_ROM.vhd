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
    Port ( Memo_sel : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction :OUT STD_LOGIC_VECTOR (11 DOWNTO 0));    
end Program_ROM;

architecture Behavioral of Program_ROM is

type instructions is array (0 to 7) of std_logic_vector(11 downto 0);

signal program_ROM : instructions := (
    --IIRR1RR2IVAL  
    "100100000001",
    "100110000011",
    "010100000000",
    "001110110000",
    "000110100000",
    "110110000111",
    "110000000011",
    "000000000000"

);

begin

Instruction <= program_ROM(to_integer(unsigned(Memo_sel)));


end Behavioral;

