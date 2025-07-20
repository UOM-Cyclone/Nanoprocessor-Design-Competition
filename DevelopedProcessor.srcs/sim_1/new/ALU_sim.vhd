----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2024 20:54:29
-- Design Name: 
-- Module Name: ALU_sim - Behavioral
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

entity ALU_sim is
--  Port ( );
end ALU_sim;

architecture Behavioral of ALU_sim is

component ALU
    Port ( input_1 : in STD_LOGIC_VECTOR (3 downto 0);
           input_2 : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Sign : out STD_LOGIC;
           selector : in STD_LOGIC_VECTOR (3 downto 0));
end component;

signal I1,I2,output,Sel : std_logic_vector(3 downto 0);
signal overflow, Zero, Sign : std_logic;


begin
UUT : ALU port map(I1, I2, output, overflow, Zero, Sign, Sel);


process begin

for temp in 0 to 13 loop  
     Sel <= std_logic_vector(to_unsigned(temp, 4));
        
                    I1<= "1110";
                    I2<= "1101";
                    wait for 100 ns;
                    
                    I1<= "1011";
                    I2<= "0110";
                    wait for 100 ns; 
                       
                    I1<= "0000";
                    I2<= "1111";
                    wait for 100 ns;
                    
                    I1<= "0010";
                    I2<= "1100";
                    wait for 100 ns;
        


     
    end loop;

    wait;  

end process;


end Behavioral;
