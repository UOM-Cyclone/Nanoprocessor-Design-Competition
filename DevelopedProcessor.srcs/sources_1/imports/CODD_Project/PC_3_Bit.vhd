----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 09:38:49 AM
-- Design Name: 
-- Module Name: PC_3_Bit - Behavioral
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

entity PC_3_Bit is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           I : in STD_LOGIC_VECTOR (2 downto 0);
           Memo_sel : out STD_LOGIC_VECTOR (2 downto 0));
end PC_3_Bit;

architecture Behavioral of PC_3_Bit is

begin

PROCESS (Clk) BEGIN
    IF (RISING_EDGE(Clk)) THEN
        IF Reset = '0' THEN
            Memo_sel<=I;
        ELSE
            Memo_sel<="000"; 
        END IF;
    END IF;
END PROCESS;



end Behavioral;









