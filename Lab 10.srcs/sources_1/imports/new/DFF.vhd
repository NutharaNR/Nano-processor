----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 10:17:08 PM
-- Design Name: 
-- Module Name: DFF - Behavioral
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

entity DFF is
    Port ( Clk : in STD_LOGIC;
           In_s : in STD_LOGIC;
           Out_s : out STD_LOGIC);
end DFF;

architecture Behavioral of DFF is
SIGNAL OUT_SS : STD_LOGIC:='0';
begin
    process (Clk) begin
    if rising_edge(Clk) then
        OUT_SS<=In_s;
    end if;
    end process;
Out_s<=OUT_SS;
end Behavioral;
