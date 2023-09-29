----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/17/2022 01:33:01 PM
-- Design Name: 
-- Module Name: MUX_8_8 - Behavioral
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

entity MUX_8_8 is
    Port ( A0 : in STD_LOGIC_VECTOR (7 downto 0);
           A1 : in STD_LOGIC_VECTOR (7 downto 0);
           A2 : in STD_LOGIC_VECTOR (7 downto 0);
           A3 : in STD_LOGIC_VECTOR (7 downto 0);
           A4 : in STD_LOGIC_VECTOR (7 downto 0);
           A5 : in STD_LOGIC_VECTOR (7 downto 0);
           A6 : in STD_LOGIC_VECTOR (7 downto 0);
           A7 : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0));
end MUX_8_8;

architecture Behavioral of MUX_8_8 is
component MUX_4_8 port (
       A1 : in STD_LOGIC_VECTOR (7 downto 0);
       A2 : in STD_LOGIC_VECTOR (7 downto 0);
       A3 : in STD_LOGIC_VECTOR (7 downto 0);
       A4 : in STD_LOGIC_VECTOR (7 downto 0);
       S_out : out STD_LOGIC_VECTOR (7 downto 0);
       Sel : in STD_LOGIC_VECTOR (1 downto 0);
       En : in STD_LOGIC
    );
end component;
SIGNAL S1,S2 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL EN1,En2 : STD_LOGIC ;
begin
MUX_1 : MUX_4_8 port map(
    A1=>A0,
    A2=>A1,
    A3=>A2,
    A4=>A3,
    S_out=>S1,
    Sel=>B(1 downto 0),
    En=>En1
    );  
MUX_2 : MUX_4_8 port map(
    A1=>A4,
    A2=>A5,
    A3=>A6,
    A4=>A7,
    S_out=>S2,
    Sel=>B(1 downto 0),
    En=>En2
    );  
    En1<=not(B(2));
    En2<=B(2); 
    S(0)<= S1(0) or S2(0);
    S(1)<= S1(1) or S2(1);
    S(2)<= S1(2) or S2(2);
    S(3)<= S1(3) or S2(3);
    S(4)<= S1(4) or S2(4);
    S(5)<= S1(5) or S2(5);
    S(6)<= S1(6) or S2(6);
    S(7)<= S1(7) or S2(7);
end Behavioral;
