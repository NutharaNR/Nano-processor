----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/06/2022 04:49:36 AM
-- Design Name: 
-- Module Name: PROM - Behavioral
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

entity PROM is
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (14 downto 0));
end PROM;

architecture Behavioral of PROM is
    type rom_type is array (0 to 15) of std_logic_vector (14 downto 0);
    signal program_ROM : rom_type := (
        	"001010100000101",  -- MOVI R5,5
            "001001100000010",  -- MOVI R3,2
            "000110101100000",  -- SUB R5,R3
            "011110101100000",  -- POW R5,R3
            "111010010100000",  -- CMP R4,R5
            "000011001100000",  -- ADD R6,R3
            "010011010100000",  -- MUL R6,R5
            "100100011100000",  -- INC R7
            "011011001100000",  -- MOD R6,R3
            "000101100000000",  -- NEG R3
            "101111100000000",  -- BITSHIFT-RIGHT R7
            "110011000000000",  -- BITSHIFT-LEFT R6
            "101010100000000",  -- DEC R5
            "001110100001101",  -- JZR R5,13
            "100011000000000",  -- SHOW R6
            "000000000000000"   -- WAIT

     );  

begin
Output <= program_ROM(to_integer(unsigned(Input)));

end Behavioral;
