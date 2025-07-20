----------------------------------------------------------------------------------
-- Company: CSE@UOM
-- Engineer: Dasun W.A.T.
-- 
-- Create Date: 05.03.2024 09:16:45
-- Design Name: 
-- Module Name: D_FF - Behavioral
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

entity D_FF is
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end D_FF;

architecture Behavioral of D_FF is

begin
PROCESS (Clk) BEGIN
    IF Res='1' THEN
        Q <= '0';
        Qbar <= '1';
    ELSE
        IF (rising_edge(Clk)) THEN
            Q <= D;
            Qbar <= NOT D;
        END IF;
    END IF;
END PROCESS;


end Behavioral;
