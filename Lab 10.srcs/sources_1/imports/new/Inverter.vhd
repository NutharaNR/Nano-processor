----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 08:35:33 PM
-- Design Name: 
-- Module Name: Inverter - Behavioral
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

entity Inverter is
    Port ( B_in : in STD_LOGIC_VECTOR (7 downto 0);
           En : in STD_LOGIC;
           B_out : out STD_LOGIC_VECTOR (7 downto 0));
end Inverter;

architecture Behavioral of Inverter is
    

begin

B_out(0) <= EN XOR B_in(0); 
B_out(1) <= EN XOR B_in(1);
B_out(2) <= EN XOR B_in(2);
B_out(3) <= EN XOR B_in(3);
B_out(4) <= EN XOR B_in(4); 
B_out(5) <= EN XOR B_in(5);
B_out(6) <= EN XOR B_in(6);
B_out(7) <= EN XOR B_in(7);
end Behavioral;
