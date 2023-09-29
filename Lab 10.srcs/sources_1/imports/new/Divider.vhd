----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/18/2022 10:56:34 AM
-- Design Name: 
-- Module Name: Divider - Behavioral
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

entity Divider is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S_out : out STD_LOGIC_VECTOR (7 downto 0);
           S_Mod : out STD_LOGIC_VECTOR (7 downto 0));
end Divider;

architecture Behavioral of Divider is
component Divider_1bit port(
    A : in STD_LOGIC_VECTOR (7 downto 0);
    B : in STD_LOGIC_VECTOR (7 downto 0);
    S_out : out STD_LOGIC;
    S_mod : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
component Combiner_div port(
    A : in STD_LOGIC_VECTOR (7 downto 0);
    B : in STD_LOGIC;
    S_out : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
SIGNAL res1,res2,res3,res4,res5,res6,res7,init : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL com1,com2,com3,com4,com5,com6,com7,com8 : STD_LOGIC_VECTOR (7 downto 0);
begin
Divider_1 : Divider_1bit port map(
    A=>com1,
    B=>B,
    S_out=>S_out(7),
    S_mod=>res1
    );
Divider_2 : Divider_1bit port map(
    A=>com2,
    B=>B,
    S_out=>S_out(6),
    S_mod=>res2
    );
Divider_3 : Divider_1bit port map(
    A=>com3,
    B=>B,
    S_out=>S_out(5),
    S_mod=>res3
    );
Divider_4 : Divider_1bit port map(
    A=>com4,
    B=>B,
    S_out=>S_out(4),
    S_mod=>res4
    );
Divider_5 : Divider_1bit port map(
    A=>com5,
    B=>B,
    S_out=>S_out(3),
    S_mod=>res5
    );
Divider_6 : Divider_1bit port map(
    A=>com6,
    B=>B,
    S_out=>S_out(2),
    S_mod=>res6
    );
Divider_7 : Divider_1bit port map(
    A=>com7,
    B=>B,
    S_out=>S_out(1),
    S_mod=>res7
    );
Divider_8 : Divider_1bit port map(
    A=>com8,
    B=>B,
    S_out=>S_out(0),
    S_mod=>S_Mod
    );
Combiner_1 : Combiner_div port map(
    A=>"00000000",--change
    B=>A(7),
    S_out=>com1
    );
Combiner_2 : Combiner_div port map(
    A=>res1,
    B=>A(6),
    S_out=>com2
    );
Combiner_3 : Combiner_div port map(
    A=>res2,
    B=>A(5),
    S_out=>com3
    );
Combiner_4 : Combiner_div port map(
    A=>res3,
    B=>A(4),
    S_out=>com4
    );
Combiner_5 : Combiner_div port map(
    A=>res4,
    B=>A(3),
    S_out=>com5
    );
Combiner_6 : Combiner_div port map(
    A=>res5,
    B=>A(2),
    S_out=>com6
    );
Combiner_7 : Combiner_div port map(
    A=>res6,
    B=>A(1),
    S_out=>com7
    );
Combiner_8 : Combiner_div port map(
    A=>res7,
    B=>A(0),
    S_out=>com8
    );
    init(0)<=A(7);
    init(1)<=A(7);
    init(2)<=A(7);
    init(3)<=A(7);
    init(4)<=A(7);
    init(5)<=A(7);
    init(6)<=A(7);
    init(7)<=A(7);
end Behavioral;
