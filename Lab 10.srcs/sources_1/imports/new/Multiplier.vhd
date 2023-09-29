----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2022 09:33:19 AM
-- Design Name: 
-- Module Name: Multiplier - Behavioral
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

entity Multiplier is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S_out : out STD_LOGIC_VECTOR (7 downto 0);
           C_out : out STD_LOGIC);
end Multiplier;

architecture Behavioral of Multiplier is
component RCA8bit port(
           A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0);
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC
    );
end component;
component BitShifter port (
    A : in STD_LOGIC_VECTOR (7 downto 0);
    LR : in STD_LOGIC;
    S_out : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
component Combiner port (
    A : in STD_LOGIC_VECTOR (7 downto 0);
    B : in STD_LOGIC;
    S_out : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
SIGNAL S1,S2,S3,S4,S5,S6,S0 : STD_LOGIC_VECTOR (7 downto 0); 
SIGNAL C0,C1,C2 ,C3,C4,C5,C6,C7 : STD_LOGIC;
SIGNAL B0,B1,B2,B3,B4,B5,B6,B7 : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL BS1,BS2,BS3,BS4,BS5,BS6,BS7 : STD_LOGIC_VECTOR (7 downto 0);
begin
RCA8bit_0 : RCA8bit port map(
    A=>"00000000",
    B=>B0,
    S=>S0,
    C_in=>'0',
    C_out=>C0
    );
RCA8bit_1 : RCA8bit port map(
    A=>S0,
    B=>B1,
    S=>S1,
    C_in=>'0',
    C_out=>C1
    );
RCA8bit_2 : RCA8bit port map(
    A=>S1,
    B=>B2,
    S=>S2,
    C_in=>'0',
    C_out=>C2
    );
RCA8bit_3 : RCA8bit port map(
    A=>S2,
    B=>B3,
    S=>S3,
    C_in=>'0',
    C_out=>C3
    );
RCA8bit_4 : RCA8bit port map(
    A=>S3,
    B=>B4,
    S=>S4,
    C_in=>'0',
    C_out=>C4
    );
RCA8bit_5 : RCA8bit port map(
    A=>S4,
    B=>B5,
    S=>S5,
    C_in=>'0',
    C_out=>C5
    );
RCA8bit_6 : RCA8bit port map(
    A=>S5,
    B=>B6,
    S=>S6,
    C_in=>'0',
    C_out=>C6
    );
RCA8bit_7 : RCA8bit port map(
    A=>S6,
    B=>B7,
    S=>S_out,
    C_in=>'0',
    C_out=>C7
    );
BitShifter_1 : BitShifter port map(
    A=>A,
    LR=>'0',
    S_out=>BS1
    );
BitShifter_2 : BitShifter port map(
    A=>BS1,
    LR=>'0',
    S_out=>BS2
    );
BitShifter_3 : BitShifter port map(
    A=>BS2,
    LR=>'0',
    S_out=>BS3
    );
BitShifter_4 : BitShifter port map(
    A=>BS3,
    LR=>'0',
    S_out=>BS4
    );
BitShifter_5 : BitShifter port map(
    A=>BS4,
    LR=>'0',
    S_out=>BS5
    );
BitShifter_6 : BitShifter port map(
    A=>BS5,
    LR=>'0',
    S_out=>BS6
    );
BitShifter_7 : BitShifter port map(
    A=>BS6,
    LR=>'0',
    S_out=>BS7
    );
Combiner_0 : Combiner port map(
    A=>A,
    B=>B(0),
    S_out=>B0
    );
Combiner_1 : Combiner port map(
    A=>BS1,
    B=>B(1),
    S_out=>B1
    );
Combiner_2 : Combiner port map(
    A=>BS2,
    B=>B(2),
    S_out=>B2
    );
Combiner_3 : Combiner port map(
    A=>BS3,
    B=>B(3),
    S_out=>B3
    );
Combiner_4 : Combiner port map(
    A=>BS4,
    B=>B(4),
    S_out=>B4
    );
Combiner_5 : Combiner port map(
    A=>BS5,
    B=>B(5),
    S_out=>B5
    );
Combiner_6 : Combiner port map(
    A=>BS6,
    B=>B(6),
    S_out=>B6
    );
Combiner_7 : Combiner port map(
    A=>BS7,
    B=>B(7),
    S_out=>B7
    );
C_out<=(C0 or C1 or C2 or C3 or C4 or C5 or C6 or C7);
end Behavioral;
