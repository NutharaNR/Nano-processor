----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 09:52:46 PM
-- Design Name: 
-- Module Name: Reseter - Behavioral
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

entity Reseter is
    Port ( CLK : in STD_LOGIC;
           Reset_in : in STD_LOGIC;
           Reset_out : out STD_LOGIC);
end Reseter;

architecture Behavioral of Reseter is
component DFF port(
   Clk : in STD_LOGIC;
   In_s : in STD_LOGIC;
   Out_s : out STD_LOGIC
    );
end component;
SIGNAL FirstDff,SecondDff,ResetDff,InDff,ResDff : STD_LOGIC;
begin
FDFF : DFF port map (
    Clk=>CLK,
    In_s=>InDff,
    Out_s=>FirstDff
    );
SDFF : DFF port map(
    Clk=>CLK,
    In_s=>FirstDff,
    Out_s=>SecondDff
    );
RDFF : DFF port map (
    Clk=>CLK,
    In_s=>ResDff,
    Out_s=>ResetDff
    );
ResDff<=ResetDff or Reset_in;
InDff <= (NOT(Reset_in) or ResDff or SecondDff or FirstDff);
Reset_out<= (Reset_in or not(SecondDff)) and (Reset_in or not(ResetDff));
end Behavioral;
