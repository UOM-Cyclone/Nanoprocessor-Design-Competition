----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2024 11:32:13
-- Design Name: 
-- Module Name: AU_sim - Behavioral
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

entity AU_sim is
--  Port ( );
end AU_sim;

architecture Behavioral of AU_sim is
component adder_subtractor
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;  --To substract -> 1
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

Signal A, B, S: STD_LOGIC_VECTOR(3 downto 0);
Signal O, Z, M : STD_LOGIC;

begin
UUT: adder_subtractor port map(A, B, M, S, O, Z);

process
begin
    A <= "0000";
    B <= "0000";
    M <= '0';
    WAIT FOR 100NS;
    
    A <= "0001";
    B <= "1111";
    M <= '0';
    WAIT FOR 100NS;
    
    A <= "0001";
    B <= "0011";
    M <= '0';
    WAIT FOR 100NS;

    A <= "0011";
    B <= "1001";
    M <= '0';
    WAIT FOR 100NS;
    
    A <= "0010";
    B <= "0010";
    M <= '1';
    WAIT FOR 100NS;
    
    A <= "0110";
    B <= "0010";
    M <= '1';
    WAIT FOR 100NS;
    
    A <= "0110";
    B <= "0011";
    M <= '1';
    WAIT FOR 100NS;
    
    A <= "1000";
    B <= "1000";
    M <= '0';
    WAIT;
    
end process;

end Behavioral;
