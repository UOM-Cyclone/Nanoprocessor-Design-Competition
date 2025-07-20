----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 13:21:05
-- Design Name: 
-- Module Name: Processor_Sim - Behavioral
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

entity Processor_Sim is
--  Port ( );
end Processor_Sim;

architecture Behavioral of Processor_Sim is

component Processor
    Port ( Clk : in STD_LOGIC;
           RomSel : in STD_LOGIC_VECTOR (2 downto 0);
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           SegOn : out STD_LOGIC_VECTOR (3 downto 0);
           SevenSegOut : out STD_LOGIC_VECTOR (6 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Negative: out STD_LOGIC;
           Res : in STD_LOGIC);
end component;

Signal LED, SegOn : STD_LOGIC_VECTOR(3 downto 0);
Signal SevenSeg : STD_LOGIC_VECTOR(6 downto 0);
signal RomSel : STD_LOGIC_VECTOR (2 downto 0);
Signal Clk, Res, Overflow, Zero, Negative : STD_LOGIC;

--Signal pc, RegEn : STD_LOGIC_VECTOR(2 downto 0);
--Signal I : STD_LOGIC_VECTOR (11 downto 0);
--Signal LoadSel : STD_LOGIC;
--Signal RegData, LED1 : STD_LOGIC_VECTOR(3 downto 0);

begin
--UUT:Processor port map(Clk, LED, LED1, pc, I, RegEn, LoadSel, RegData, SegOn, SevenSeg, Overflow, Zero, Res);
UUT:Processor port map(Clk, RomSel, LED, SegOn, SevenSeg, Overflow, Zero, Negative, Res);

Process
begin
    Res <= '1';
    wait for 200ns;
    Res <= '0';
    wait;
end process;

--Res <= '0';

Clk_process : Process
begin
    Clk <= '0';
    wait for 5ns;
    Clk <= '1';
    wait for 5ns;
end process;

process
begin
    RomSel <= "001";
    wait for 9000ns;
    
    RomSel <= "110";
    wait;
end process;

end Behavioral;
