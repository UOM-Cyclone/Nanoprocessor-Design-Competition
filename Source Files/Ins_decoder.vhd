----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 05:11:32 PM
-- Design Name: 
-- Module Name: Ins_decoder - Behavioral
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

entity Ins_decoder is
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
           RegVal : in STD_LOGIC_VECTOR (3 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSel : out STD_LOGIC;
           ImdVal : out STD_LOGIC_VECTOR (3 downto 0);
           RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel2 : out STD_LOGIC_VECTOR (2 downto 0);
           isSub : out STD_LOGIC;
           JumpFlag : out STD_LOGIC;
           JumpAdd : out STD_LOGIC_VECTOR (2 downto 0));
end Ins_decoder;

architecture Behavioral of Ins_decoder is

begin
    LoadSel <= '1' when (Ins(11 downto 10) = "00" or Ins(11 downto 10) = "01") else '0';
                
    RegEn <= Ins(9 downto 7);
    
    ImdVal <= Ins(3 downto 0) when (Ins(11 downto 10) = "10") else
              RegVal when (Ins(11 downto 10) = "11") else "0000";
              
    RegSel1 <= Ins(9 downto 7) when ( Ins(11 downto 10) = "00" or Ins(11 downto 10) = "11") else "000";
    
    RegSel2 <= Ins(9 downto 7) when (Ins(11 downto 10) = "01") else Ins(6 downto 4);
    
    isSub <= '1' when (Ins(11 downto 10) = "01") else '0';
    
    JumpFlag <= '1' when (Ins(11 downto 10) = "11" and RegVal = "0000") else '0';
    
    JumpAdd <= Ins(2 downto 0);

end Behavioral;
