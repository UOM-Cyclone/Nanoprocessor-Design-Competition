----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2024 17:15:59
-- Design Name: 
-- Module Name: LUT_8_12 - Behavioral
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
use ieee.numeric_std.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LUT_8_12 is
  Port (Input : in STD_LOGIC_VECTOR(2 downto 0);
        Output : out STD_LOGIC_VECTOR(11 downto 0));
end LUT_8_12;

architecture Behavioral of LUT_8_12 is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
    signal instruction_ROM : rom_type := (
             "------------------",
             "------------------",
             "------------------",
             "------------------",
             "------------------",
             "------------------",
             "------------------",
             "------------------");

begin

Output <= instruction_ROM(to_integer(unsigned(Input))); 

end Behavioral;
