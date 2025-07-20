----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 02:03:58 PM
-- Design Name: 
-- Module Name: adder_subtractor - Behavioral
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

entity adder_subtractor is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end adder_subtractor;

architecture Behavioral of adder_subtractor is

COMPONENT RCA_4 
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C3_out: out STD_LOGIC;
           C_out : out STD_LOGIC);
end COMPONENT;

SIGNAL X,Sum : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal C_out, Carry3: STD_LOGIC;

begin

X(0) <= B(0) XOR M;
X(1) <= B(1) XOR M;
X(2) <= B(2) XOR M;
X(3) <= B(3) XOR M;

RCA_4_0 : RCA_4
    PORT MAP(
        A0 => A(0),
        A1 => A(1),
        A2 => A(2),
        A3 => A(3),
        B0 => X(0),
        B1 => X(1),
        B2 => X(2),
        B3 => X(3),
        C_in => M,
        S0 => Sum(0),
        S1 => Sum(1),
        S2 => Sum(2), 
        S3 => Sum(3),
        C3_out => Carry3,
        C_out => C_out
    );

Overflow <= C_out XOR Carry3;
Zero <= (Sum(0) NOR Sum(1)) AND (Sum(2) NOR Sum(3));
S <= Sum;

end Behavioral;
