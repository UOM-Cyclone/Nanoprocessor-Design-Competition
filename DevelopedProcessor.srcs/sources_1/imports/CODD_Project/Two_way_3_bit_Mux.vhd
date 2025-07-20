----------------------------------------------------------------------------------
-- Company: 
-- Engineer: DE SILVA A D D T 
-- 
-- Create Date: 04/12/2024 09:25:44 PM
-- Design Name: 
-- Module Name: Two_way_3_bit_Mux - Behavioral
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

entity Two_way_3_bit_Mux is
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           O : OUT STD_LOGIC_VECTOR (2 downto 0));
end Two_way_3_bit_Mux;

architecture Behavioral of Two_way_3_bit_Mux is

begin

--O(0)<= (NOT(S) AND I0(0)) OR (S AND I1(0));
--O(1)<= (NOT(S) AND I0(1)) OR (S AND I1(1));
--O(2)<= (NOT(S) AND I0(2)) OR (S AND I1(2));
PROCESS(I0,I1,S)
BEGIN
    IF S = '0' THEN 
        O<=I0;
    ELSE 
        O<=I1;
    END IF;
END PROCESS;


end Behavioral;
