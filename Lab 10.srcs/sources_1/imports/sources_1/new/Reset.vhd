----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 01:29:51 PM
-- Design Name: 
-- Module Name: Reset - Behavioral
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

entity Reset is
    Port ( reset : in STD_LOGIC;
           I : out STD_LOGIC_VECTOR (7 downto 0);
           RegEN : out STD_LOGIC_VECTOR (7 downto 0));
end Reset;

architecture Behavioral of Reset is

begin
process (reset)begin
        if reset = '1' then
            I <= "00000000";
            RegEN <= "11111111";
        else
            I <= "11111111";
            RegEN <= "00000000";
            
        end if;
end process;

end Behavioral;
