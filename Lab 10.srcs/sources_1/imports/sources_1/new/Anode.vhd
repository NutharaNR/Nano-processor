----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/17/2022 12:35:50 PM
-- Design Name: 
-- Module Name: Anode - Behavioral
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
use ieee.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Anode is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           A_out : out STD_LOGIC_VECTOR (7 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
end Anode;

architecture Behavioral of Anode is
signal complement : std_logic_vector(7 downto 0) := "00000001";
begin
process(A)begin
    if A(7)='1'then
        Anode <= "1011";
        A_out <= NOT(std_logic_vector((unsigned(A))-(unsigned(complement))));
    else
        Anode <= "1111";
        A_out <= A;
    end if;
end process;

end Behavioral;
