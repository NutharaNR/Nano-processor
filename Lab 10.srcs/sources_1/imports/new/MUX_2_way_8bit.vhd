----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/18/2022 10:55:06 AM
-- Design Name: 
-- Module Name: MUX_2_way_8bit - Behavioral
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

entity MUX_2_way_8bit is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Sel : in STD_LOGIC;
           S_out : out STD_LOGIC_VECTOR (7 downto 0)
           );
end MUX_2_way_8bit;

architecture Behavioral of MUX_2_way_8bit is

begin
S_out(0)<= (A(0) and sel) or (B(0) and not(sel)); 
S_out(1)<= (A(1) and sel) or (B(1) and not(sel));
S_out(2)<= (A(2) and sel) or (B(2) and not(sel));
S_out(3)<= (A(3) and sel) or (B(3) and not(sel));
S_out(4)<= (A(4) and sel) or (B(4) and not(sel));
S_out(5)<= (A(5) and sel) or (B(5) and not(sel));
S_out(6)<= (A(6) and sel) or (B(6) and not(sel));
S_out(7)<= (A(7) and sel) or (B(7) and not(sel));
end Behavioral;
