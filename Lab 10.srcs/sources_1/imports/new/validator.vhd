----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/17/2022 11:49:49 AM
-- Design Name: 
-- Module Name: validator - Behavioral
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

entity validator is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0));
end validator;

architecture Behavioral of validator is

begin
    S(0)<=(A(0) and B) or not(B);
    S(1)<=A(1) and B;
    S(2)<=A(2) and B;
    S(3)<=A(3) and B;
    S(4)<=A(4) and B;
    S(5)<=A(5) and B;
    S(6)<=A(6) and B;
    S(7)<=A(7) and B;
end Behavioral;
