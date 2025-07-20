----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2024 01:05:12
-- Design Name: 
-- Module Name: Reg_by_DFF - Behavioral
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

entity Reg_by_DFF is
    Port ( Reg_in : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_out : out STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC);
end Reg_by_DFF;

architecture Behavioral of Reg_by_DFF is

component D_FF
    Port ( D : in STD_LOGIC;
       Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC;
       Qbar : out STD_LOGIC);
end component;    

signal D0,D1,D2,D3 : std_logic;
signal Q0,Q1,Q2,Q3 : std_logic;   
signal A : std_logic;

begin

    D0 <= (Reg_in(0) AND En) OR (Q0 AND NOT En);
    D1 <= (Reg_in(1) AND En) OR (Q1 AND NOT En);
    D2 <= (Reg_in(2) AND En) OR (Q2 AND NOT En);
    D3 <= (Reg_in(3) AND En) OR (Q3 AND NOT En);
    
    D_FF0 : D_FF 
        port map (   
        D => D0, 
        Res => Res, 
        Clk => Clk,   
        Q => Q0); 
        
    
    D_FF1 : D_FF 
        port map (   
        D => D1, 
        Res => Res, 
        Clk => Clk,   
        Q => Q1); 
        
    D_FF2 : D_FF 
        port map (   
        D => D2, 
        Res => Res, 
        Clk => Clk,   
        Q => Q2); 
            
        
    D_FF3 : D_FF 
        port map (   
        D => D3, 
        Res => Res, 
        Clk => Clk,   
        Q => Q3); 
        
    Reg_out(0) <= Q0;
    Reg_out(1) <= Q1;
    Reg_out(2) <= Q2;
    Reg_out(3) <= Q3; 
          

end Behavioral;
