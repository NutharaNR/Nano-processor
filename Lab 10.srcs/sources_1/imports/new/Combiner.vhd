----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2022 10:12:43 AM
-- Design Name: 
-- Module Name: Combiner - Behavioral
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

entity Combiner is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC;
           S_out : out STD_LOGIC_VECTOR (7 downto 0));
end Combiner;

architecture Behavioral of Combiner is

begin
S_out(0)<=A(0) and B;
S_out(1)<=A(1) and B;
S_out(2)<=A(2) and B;
S_out(3)<=A(3) and B;
S_out(4)<=A(4) and B;
S_out(5)<=A(5) and B;
S_out(6)<=A(6) and B;
S_out(7)<=A(7) and B;
end Behavioral;
