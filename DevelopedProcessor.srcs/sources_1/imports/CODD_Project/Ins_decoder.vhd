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
    Port ( Ins : in STD_LOGIC_VECTOR (12 downto 0);
           RegVal : in STD_LOGIC_VECTOR (3 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSel : out STD_LOGIC;
           setDisplay : out STD_LOGIC;
           ImdVal : out STD_LOGIC_VECTOR (3 downto 0);
           RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel2 : out STD_LOGIC_VECTOR (2 downto 0);
           OpSelector : out STD_LOGIC_VECTOR (3 downto 0);
           JumpFlag : out STD_LOGIC;
           JumpAdd : out STD_LOGIC_VECTOR (3 downto 0));
end Ins_decoder;

architecture Behavioral of Ins_decoder is

begin
    LoadSel <= '0' when (Ins(12 downto 10) = "010" or Ins(12 downto 10) = "011" or Ins(12 downto 10) = "111") else '1';
                
    RegEn <= Ins(9 downto 7);
    
    ImdVal <= Ins(3 downto 0) when (Ins(12 downto 10) = "010") else
              RegVal;
              
    RegSel1 <= Ins(9 downto 7);
    
    RegSel2 <= Ins(6 downto 4);
    
    OpSelector <= "0000" when (Ins(12 downto 10) = "000") else 
                  "0001" when (Ins(12 downto 10) = "001") else 
                  "0010" when (Ins(12 downto 10) = "101") else
                  "0011" when (Ins(12 downto 10) = "100" and Ins(3 downto 0) = "0001") else
                  "0100" when (Ins(12 downto 10) = "100" and Ins(3 downto 0) = "0010") else
                  "0101" when (Ins(12 downto 10) = "100" and Ins(3 downto 0) = "0100") else      
                  "0110" when (Ins(12 downto 10) = "110" and Ins(3 downto 0) = "0000") else
                  "0111" when (Ins(12 downto 10) = "110" and Ins(3 downto 0) = "0001") else
                  "1000" when (Ins(12 downto 10) = "110" and Ins(3 downto 0) = "0010") else
                  "1001" when (Ins(12 downto 10) = "110" and Ins(3 downto 0) = "0011") else
                  "1010" when (Ins(12 downto 10) = "110" and Ins(3 downto 0) = "0100") else
                  "1011" when (Ins(12 downto 10) = "110" and Ins(3 downto 0) = "0101") else
                  "1100" when (Ins(12 downto 10) = "110" and Ins(3 downto 0) = "0110") else
                  "1101" when (Ins(12 downto 10) = "110" and Ins(3 downto 0) = "0111") else
                  "1110" when (Ins(12 downto 10) = "110" and Ins(3 downto 0) = "1000") else
                  "1111";
                  
    setDisplay <= '1' when Ins(12 downto 10) = "111" else '0';
    
    JumpFlag <= '1' when (Ins(12 downto 10) = "011" and RegVal = "0000") else '0';
    
    JumpAdd <= Ins(3 downto 0);

end Behavioral;
