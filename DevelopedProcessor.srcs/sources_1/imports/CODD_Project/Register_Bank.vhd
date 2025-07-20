----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2024 00:32:43
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
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
end Register_Bank;

architecture Behavioral of Register_Bank is

component Reg_by_DFF
    Port ( Reg_in : in STD_LOGIC_VECTOR (3 downto 0);
       Reg_out : out STD_LOGIC_VECTOR (3 downto 0);
       En : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Res : in STD_LOGIC);
end component;

component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
       Y : out STD_LOGIC_VECTOR (7 downto 0);
       EN : in STD_LOGIC);
end component;

signal Dec_out : STD_LOGIC_VECTOR (7 downto 0);
signal RegClk : STD_LOGIC;

begin

RegClk <= Clk; 

Decoder_3_to_8_0 :Decoder_3_to_8
port map(
I => RegEn,
Y => Dec_out,
EN => '1');

Reg_0 : Reg_by_DFF
port map(
Reg_in => "0000",
Reg_out => Reg_0_out,
En => Dec_out(0),
Clk => RegClk,
Res => Res);


Reg_1 : Reg_by_DFF
port map(
Reg_in => Reg_in,
Reg_out => Reg_1_out,
En => Dec_out(1),
Clk => RegClk,
Res => Res);


Reg_2 : Reg_by_DFF
port map(
Reg_in => Reg_in,
Reg_out => Reg_2_out,
En => Dec_out(2),
Clk => RegClk,
Res => Res);


Reg_3 : Reg_by_DFF
port map(
Reg_in => Reg_in,
Reg_out => Reg_3_out,
En => Dec_out(3),
Clk => RegClk,
Res => Res);


Reg_4 : Reg_by_DFF
port map(
Reg_in => Reg_in,
Reg_out => Reg_4_out,
En => Dec_out(4),
Clk => RegClk,
Res => Res);


Reg_5 : Reg_by_DFF
port map(
Reg_in => Reg_in,
Reg_out => Reg_5_out,
En => Dec_out(5),
Clk => RegClk,
Res => Res);


Reg_6 : Reg_by_DFF
port map(
Reg_in => Reg_in,
Reg_out => Reg_6_out,
En => Dec_out(6),
Clk => RegClk,
Res => Res);


Reg_7 : Reg_by_DFF
port map(
Reg_in => Reg_in,
Reg_out => Reg_7_out,
En => Dec_out(7),
Clk => RegClk,
Res => Res);

end Behavioral;
