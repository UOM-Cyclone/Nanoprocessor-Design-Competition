----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2024 10:06:59
-- Design Name: 
-- Module Name: RegBank_sim - Behavioral
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

entity RegBank_sim is
--  Port ( );
end RegBank_sim;

architecture Behavioral of RegBank_sim is

component Register_Bank
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           RegEn : in STD_LOGIC_VECTOR (2 downto 0);
           Reg_in : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_0_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_1_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_2_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_3_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_4_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_5_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_6_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_7_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal clk, res :STD_LOGIC;
signal Data, R0, R1, R2, R3, R4, R5, R6, R7 : STD_LOGIC_VECTOR(3 downto 0);
signal En : STD_LOGIC_VECTOR(2 downto 0);


--Team Cyclone
--Index numbers of team members
    --Dilshan U L D    - 220126M    110101101111011110
    --Dasun W A T      - 220094K    110101101110111110
    --Diwakar J S P    - 220144P    110101101111110000
    --De Silva A D D T - 220098C    110101101111000010

begin 
UUT : Register_Bank port map(clk, res, En, Data, R0, R1, R2, R3, R4, R5, R6, R7);

Process
begin
    Res <= '1';
    wait for 100ns;
    Res <= '0';
    wait;
end process;

--Res <= '0';

Clk_process : Process
begin
    Clk <= '0';
    wait for 10ns;
    Clk <= '1';
    wait for 10ns;
end process;

PROCESS
begin
    En <= "000";
    Data <= "1110";
    wait for 200ns;
    
    En <= "001";
    Data <= "1101";
    wait for 100ns;
    
    En <= "010";
    Data <= "1011";
    wait for 100ns;
    
    En <= "011";
    Data <= "0101";
    wait for 100ns;
    
    En <= "100";
    Data <= "0000";
    wait for 100ns;
    
    En <= "101";
    Data <= "1111";
    wait for 100ns;
    
    En <= "110";
    Data <= "0010";
    wait for 100ns;
    
    En <= "111";
    Data <= "1100";
    wait;
END PROCESS;
    
end Behavioral;
