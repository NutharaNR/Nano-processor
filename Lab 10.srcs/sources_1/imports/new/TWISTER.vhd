----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 09:19:18 PM
-- Design Name: 
-- Module Name: TWISTER - Behavioral
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

entity TWISTER is
    Port ( IN1 : in STD_LOGIC_VECTOR (2 downto 0);
           IN2 : in STD_LOGIC_VECTOR (2 downto 0);
           OUT1 : out STD_LOGIC_VECTOR (2 downto 0);
           OUT2 : out STD_LOGIC_VECTOR (2 downto 0);
           TWI : in STD_LOGIC);
end TWISTER;

architecture Behavioral of TWISTER is
component MUX_2_WAY_4bit port(
       IN1 : in STD_LOGIC_VECTOR (2 downto 0);
       IN2 : in STD_LOGIC_VECTOR (2 downto 0);
       RS : in STD_LOGIC;
       OT : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;
SIGNAL RS1,RS2 : STD_LOGIC;
begin
MUX1 : MUX_2_WAY_4bit port map(
    IN1=>IN1,
    IN2=>IN2,
    OT=>OUT1,
    RS=>RS1
    );
MUX2 : MUX_2_WAY_4bit port map(
    IN1=>IN1,
    IN2=>IN2,
    OT=>OUT2,
    RS=>RS2
    );
RS1<=NOT(TWI);
RS2<=TWI;
end Behavioral;
