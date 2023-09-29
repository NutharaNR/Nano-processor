----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 09:00:26 PM
-- Design Name: 
-- Module Name: MUX_2_WAY_4bit - Behavioral
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

entity MUX_2_WAY_4bit is
    Port ( IN1 : in STD_LOGIC_VECTOR (2 downto 0);
           IN2 : in STD_LOGIC_VECTOR (2 downto 0);
           RS : in STD_LOGIC;
           OT : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2_WAY_4bit;

architecture Behavioral of MUX_2_WAY_4bit is

begin
OT(0)<=(IN1(0) and RS) or (IN2(0) and not(RS));
OT(1)<=(IN1(1) and RS) or (IN2(1) and not(RS));
OT(2)<=(IN1(2) and RS) or (IN2(2) and not(RS));
end Behavioral;
