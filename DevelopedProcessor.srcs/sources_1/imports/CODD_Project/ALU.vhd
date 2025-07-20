----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 05:34:11 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( input_1 : in STD_LOGIC_VECTOR (3 downto 0);
           input_2 : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Sign : out STD_LOGIC;
           selector : in STD_LOGIC_VECTOR (3 downto 0));
end ALU;

architecture Behavioral of ALU is
    signal sum, diff : unsigned(4 downto 0);
    signal shiftLeft,shiftRight : unsigned(3 downto 0);
    signal mul : unsigned(7 downto 0);
    signal lesser, greater, equal, tempOut : std_logic_vector(3 downto 0);
    signal andOP, orOP, notOP, xorOP, nandOP, norOP, xnorOP : std_logic_vector(3 downto 0);
    signal I_1, I_2 : unsigned(3 downto 0);
    signal tempOverflow : std_logic;
begin
    
    I_1 <= unsigned(input_1);   
    I_2 <= unsigned(input_2);  

    sum <= ('0' & I_1) + ('0' & I_2);
    diff <= ('1' & I_1) - ('0' & I_2);
    mul <= I_1 * I_2;
    lesser <= "0001" when (I_1 < I_2) else "0000";
    greater <= "0001" when (I_1 > I_2) else "0000";
    equal <= "0001" when (I_1 = I_2) else "0000";
    andOP <= input_1 and input_2;
    orOP <= input_1 or input_2;
    xorOP <= input_1 xor input_2;
    notOP <= not input_1 ;
    nandOP <= input_1 nand input_2;
    norOP <= input_1 nor input_2;
    xnorOP <= input_1 xnor input_2;
    shiftLeft <= shift_left(I_1, to_integer(I_2));
    shiftRight <= shift_right(I_1, to_integer(I_2));
    
    with selector select
        tempOut <= std_logic_vector(sum(3 downto 0)) when "0000",
                   std_logic_vector(diff(3 downto 0)) when "0001",
                   std_logic_vector(mul(3 downto 0)) when "0010",
                   greater when "0011",
                   lesser when "0100",
                   equal when "0101",
                   andOP when "0110",
                   orOP when "0111",
                   xorOP when "1000",
                   notOP when "1001",
                   nandOP when "1010",
                   norOP when "1011",
                   xnorOP when "1100",
                   std_logic_vector(shiftLeft) when "1101",
                   std_logic_vector(shiftRight) when "1110",
                   "0000" when others;
                
    tempOverflow <= std_logic(sum(4)) when (selector = "0000") else 
                '1' when (selector = "0010" and mul(7 downto 4) > "0000") else
                '0';
                
    Zero <= '1' when (tempOverflow = '0' and tempOut = "0000" and (selector = "0000" or selector = "0010")) or 
                     (tempout = "0000" and not (selector = "0000" or selector = "0010")) else
            '0';
    
    Overflow <= tempOverflow;
    output <= tempOut;
    Sign <= not diff(4) when (selector = "0001") else '0';

end Behavioral;
