----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 08:58:15 PM
-- Design Name: 
-- Module Name: 2_way_4_bit_mux - Behavioral
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

entity 2_way_4_bit_mux is
    Port ( IN1 : in STD_LOGIC_VECTOR (3 downto 0);
           IN2 : in STD_LOGIC_VECTOR (3 downto 0);
           RS : in STD_LOGIC;
           OT : out STD_LOGIC_VECTOR (3 downto 0));
end 2_way_4_bit_mux;

architecture Behavioral of 2_way_4_bit_mux is

begin


end Behavioral;
