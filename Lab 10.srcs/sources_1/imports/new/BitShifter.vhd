----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2022 10:25:08 AM
-- Design Name: 
-- Module Name: BitShifter - Behavioral
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

entity BitShifter is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           LR : in STD_LOGIC;
           S_out : out STD_LOGIC_VECTOR (7 downto 0));
end BitShifter;

architecture Behavioral of BitShifter is
component Bitshiftleft port(
    A : in STD_LOGIC_VECTOR (7 downto 0);
    S : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
component Bitshiftright port(
    A : in STD_LOGIC_VECTOR (7 downto 0);
    S : out STD_LOGIC_VECTOR (7 downto 0)
   );
end component;
SIGNAL bsleft,bsright : STD_LOGIC_VECTOR(7 downto 0);
begin
bsl : Bitshiftleft port map(
    A=>A,
    S=>bsleft
    );
bs2 : Bitshiftright port map(
    A=>A,
    S=>bsright
);
S_out(0)<= (bsleft(0) and not(LR)) or (bsright(0) and LR);
S_out(1)<= (bsleft(1) and not(LR)) or (bsright(1) and LR);
S_out(2)<= (bsleft(2) and not(LR)) or (bsright(2) and LR);
S_out(3)<= (bsleft(3) and not(LR)) or (bsright(3) and LR);
S_out(4)<= (bsleft(4) and not(LR)) or (bsright(4) and LR);
S_out(5)<= (bsleft(5) and not(LR)) or (bsright(5) and LR);
S_out(6)<= (bsleft(6) and not(LR)) or (bsright(6) and LR);
S_out(7)<= (bsleft(7) and not(LR)) or (bsright(7) and LR);
end Behavioral;
