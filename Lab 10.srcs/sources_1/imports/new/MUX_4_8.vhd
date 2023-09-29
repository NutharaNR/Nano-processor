----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/17/2022 03:57:40 PM
-- Design Name: 
-- Module Name: MUX_4_8 - Behavioral
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

entity MUX_4_8 is
    Port ( A1 : in STD_LOGIC_VECTOR (7 downto 0);
           A2 : in STD_LOGIC_VECTOR (7 downto 0);
           A3 : in STD_LOGIC_VECTOR (7 downto 0);
           A4 : in STD_LOGIC_VECTOR (7 downto 0);
           S_out : out STD_LOGIC_VECTOR (7 downto 0);
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           En : in STD_LOGIC);
end MUX_4_8;

architecture Behavioral of MUX_4_8 is
component MUX_2_8 port (
    A1 : in STD_LOGIC_VECTOR (7 downto 0);
    A2 : in STD_LOGIC_VECTOR (7 downto 0);
    En : in STD_LOGIC;
    Sel : in STD_LOGIC;
    S_Out : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
SIGNAL S1,S2 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL EN1,En2 : STD_LOGIC ;
begin
MUX_1 : MUX_2_8 port map(
    A1=>A1,
    A2=>A2,
    En=>En1,
    Sel=>Sel(0),
    S_out=>S1
    );
MUX_2 : MUX_2_8 port map(
    A1=>A3,
    A2=>A4,
    En=>En2,
    Sel=>Sel(0),
    S_out=>S2
    );
    En1<=En and not(Sel(1));
    En2<=En and (Sel(1));
    S_out(0)<= S1(0) or S2(0);
    S_out(1)<= S1(1) or S2(1);
    S_out(2)<= S1(2) or S2(2);
    S_out(3)<= S1(3) or S2(3);
    S_out(4)<= S1(4) or S2(4);
    S_out(5)<= S1(5) or S2(5);
    S_out(6)<= S1(6) or S2(6);
    S_out(7)<= S1(7) or S2(7);
end Behavioral;
