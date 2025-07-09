----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2024 10:13:06 PM
-- Design Name: 
-- Module Name: Two_way_4_bit_Mux - Behavioral
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

entity Two_way_4_bit_Mux is
    Port ( I0 : IN STD_LOGIC_VECTOR (3 downto 0);
           I1 : IN STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (3 downto 0));
end Two_way_4_bit_Mux;

architecture Behavioral of Two_way_4_bit_Mux is

begin

PROCESS(I0,I1,S)
BEGIN
    IF S = '0' THEN 
        O <= I0;
    ELSE 
        O <= I1;
    END IF;
END PROCESS;


end Behavioral;
