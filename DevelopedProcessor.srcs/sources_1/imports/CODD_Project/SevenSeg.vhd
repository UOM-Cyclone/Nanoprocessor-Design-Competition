----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2024 07:26:44 AM
-- Design Name: 
-- Module Name: SevenSeg - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SevenSeg is
    Port ( changeVal : in STD_LOGIC;
           Clk : in STD_LOGIC;
           val : in STD_LOGIC_VECTOR (3 downto 0);
           SegVal : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end SevenSeg;

architecture Behavioral of SevenSeg is

type rom is array (0 to 9) of std_logic_vector(6 downto 0);

signal segData : rom := (
     "1000000",
     "1111001",
     "0100100",
     "0110000",
     "0011001",
     "0010010",
     "0000010",
     "1111000",
     "0000000",
     "0010000");
     
 signal segmentVal : std_logic_vector(6 downto 0);
 signal showingVal : unsigned(3 downto 0) := "0000";
 signal firstDigit, secondDigit : std_logic_vector(6 downto 0) := "1111111";
 
 signal count : unsigned(1 downto 0):= "00";
 signal temp : integer := 0;

begin

showingVal <= unsigned(val);

firstDigit <= segData(1) when (changeVal = '1' and (showingVal > "1001")) else 
              "1111111";
              
              
secondDigit <= segData(to_integer(showingVal)) when (changeVal = '1' and (showingVal < "1010")) else
               segData(to_integer(showingVal - "1010")) when (changeVal = '1' and (showingVal > "1001")) else
               "1111111";

process (Clk) begin 
    if (rising_edge(Clk)) then 
        temp <= temp + 1;
        if (temp = 4000) then
            temp <= 0;
            count <= count + 1;
--            if (count = 3) then 
--                count <= 0;
--            end if;
        end if;
    end if;
end process;

process (count) begin
    case count is
        when "10" =>
            SegVal <= firstDigit;
            an <= "1101";
        when "01" =>
            SegVal <= secondDigit;
            an <= "1110";
        when "00" =>
            SegVal <= "1111111";
            an <= "1011";
        when "11" =>
            SegVal <= "1111111";
            an <= "0111";
        when others => 
            SegVal <= "1111111";
    end case;
end process;
    

end Behavioral;
