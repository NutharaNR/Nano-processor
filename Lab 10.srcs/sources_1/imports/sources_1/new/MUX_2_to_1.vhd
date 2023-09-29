----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 07:59:47 AM
-- Design Name: 
-- Module Name: MUX_1_to_2 - Behavioral
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

entity MUX_2_to_1 is
    Port ( S : in STD_LOGIC;
           IMV : in STD_LOGIC;
           LS : in STD_LOGIC;
           Y : out STD_LOGIC);
end MUX_2_to_1;

architecture Behavioral of MUX_2_to_1 is

SIGNAL Y0 , Y1 : STD_LOGIC;

begin

Y0 <= S and (not LS);
Y1 <= IMV and LS;
Y <= Y0 or Y1; 

end Behavioral;
