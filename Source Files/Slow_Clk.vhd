----------------------------------------------------------------------------------
-- Company: CSE@UOM
-- Engineer: Dasun W.A.T.
-- 
-- Create Date: 05.03.2024 14:30:05
-- Design Name: 
-- Module Name: Slow_Clk - Behavioral
-- Project Name: Counter
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

entity Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end Slow_Clk;

architecture Behavioral of Slow_Clk is
SIGNAL count:integer:=1;
SIGNAL clk_status : STD_LOGIC:='0';


begin
PROCESS (Clk_in) BEGIN
    IF(rising_edge(Clk_in)) THEN
        count <= count+1;
        IF(count = 4) THEN   --200000000
            clk_status <= NOT clk_status;
            Clk_out <= clk_status;
            count <= 1;
        END IF;
    END IF;    
END PROCESS;

end Behavioral;
