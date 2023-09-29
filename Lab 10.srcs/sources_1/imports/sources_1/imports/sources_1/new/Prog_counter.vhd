----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 09:57:13 AM
-- Design Name: 
-- Module Name: counter02 - Behavioral
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

entity Prog_counter is
    Port ( Clk : in STD_LOGIC;
           Push : in STD_LOGIC;
           TP : in STD_LOGIC_VECTOR (2 downto 0);
           MS : out STD_LOGIC_VECTOR (2 downto 0));
end Prog_counter;


architecture Behavioral of Prog_counter is

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);         
end component;

signal Clk_slow : std_logic;

begin

Slow_Clk_0 : Slow_Clk
      port map(
      Clk_in => Clk,
      Clk_out => Clk_slow
      );  
      
 process (Clk_slow) begin
   if (rising_edge (Clk_slow)) then
       if (push<='1') then
           MS <= "000";
       end if;
       
       if (push<='0') then
           MS <=TP;
       
       end if; 
   end if;
end process;          

end Behavioral;
