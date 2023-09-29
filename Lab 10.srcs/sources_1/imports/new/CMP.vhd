----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/17/2022 02:24:08 PM
-- Design Name: 
-- Module Name: CMP - Behavioral
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

entity CMP is
    Port ( Zero : in STD_LOGIC;
           Neg : in STD_LOGIC;
           S5 : out STD_LOGIC_VECTOR (7 downto 0);
           S6 : out STD_LOGIC_VECTOR (7 downto 0);
           S7 : out STD_LOGIC_VECTOR (7 downto 0));
end CMP;

architecture Behavioral of CMP is

begin
    S5(7 downto 1)<="0000000";
    S6(7 downto 1)<="0000000";
    S7(7 downto 1)<="0000000";
    S5(0)<= not(Neg) and not(Zero);
    S6(0)<= not(Zero);
    S7(0)<= not(Neg);

end Behavioral;
