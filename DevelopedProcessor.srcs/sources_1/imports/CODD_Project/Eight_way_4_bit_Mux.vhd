----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2024 11:22:06 PM
-- Design Name: 
-- Module Name: Eight_way_4_bit_Mux - Behavioral
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

entity Eight_way_4_bit_Mux is
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
end Eight_way_4_bit_Mux;

architecture Behavioral of Eight_way_4_bit_Mux is

begin

PROCESS (I0,I1,I2,I3,I4,I5,I6,I7,S)
BEGIN

IF S="000" THEN
    O <= I0;
    
ELSIF S="001" THEN
    O <= I1;
    
ELSIF S="010" THEN
    O <= I2;
        
ELSIF S="011" THEN
    O <= I3;

ELSIF S="100" THEN
    O <= I4;

ELSIF S="101" THEN
    O <= I5;

ELSIF S="110" THEN
    O <= I6; 
ELSE
    O <= I7;    
END IF;

END PROCESS;


end Behavioral;
