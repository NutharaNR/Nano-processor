----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/17/2022 11:55:22 AM
-- Design Name: 
-- Module Name: Power - Behavioral
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

entity Power is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0));
end Power;

architecture Behavioral of Power is
component Multiplier port(
            A : in STD_LOGIC_VECTOR (7 downto 0);
            B : in STD_LOGIC_VECTOR (7 downto 0);
            S_out : out STD_LOGIC_VECTOR (7 downto 0);
            C_out : out STD_LOGIC);
end component;
component validator port(
           A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0));
end component;
SIGNAL n1,n2,n3,n4,n5,n6,n7,n8 : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL nn1,nn2,nn3,nn4,nn5,nn6,nn7,nn8 : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL res1,res2,res3,res4,res5,res6 : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL c1,c2,c3,c4,c5,c6,c7,c8 : STD_LOGIC;
SIGNAL cc1,cc2,cc3,cc4,cc5,cc6,cc7 : STD_LOGIC;
begin
MUL1 : Multiplier port map(
    A=>A,
    B=>"00000001",
    S_out=>n1,
    C_out=>c1
    );
MUL2 : Multiplier port map(
    A=>n1,
    B=>n1,
    S_out=>n2,
    C_out=>c2
    );
MUL3 : Multiplier port map(
    A=>n2,
    B=>n2,
    S_out=>n3,
    C_out=>c3
    );
MUL4 : Multiplier port map(
    A=>n3,
    B=>n3,
    S_out=>n4,
    C_out=>c4
    );
MUL5 : Multiplier port map(
    A=>n4,
    B=>n4,
    S_out=>n5,
    C_out=>c5
    );
MUL6 : Multiplier port map(
    A=>n5,
    B=>n5,
    S_out=>n6,
    C_out=>c6
    );
MUL7 : Multiplier port map(
    A=>n6,
    B=>n6,
    S_out=>n7,
    C_out=>c7
    );
MUL8 : Multiplier port map(
    A=>n7,
    B=>n7,
    S_out=>n8,
    C_out=>c8
    );
val1 : validator port map(
    A=>n1,
    B=>B(0),
    S=>nn1
    );
val2 : validator port map(
    A=>n2,
    B=>B(1),
    S=>nn2
    );
val3 : validator port map(
    A=>n3,
    B=>B(2),
    S=>nn3
    );
val4 : validator port map(
    A=>n4,
    B=>B(3),
    S=>nn4
    );
val5 : validator port map(
    A=>n5,
    B=>B(4),
    S=>nn5
    );
val6 : validator port map(
    A=>n6,
    B=>B(5),
    S=>nn6
    );
val7 : validator port map(
    A=>n7,
    B=>B(6),
    S=>nn7
    );
val8 : validator port map(
    A=>n8,
    B=>B(7),
    S=>nn8
    );
MUL11 : Multiplier port map(
    A=>nn2,
    B=>nn1,
    S_out=>res1,
    C_out=>cc1
    );
MUL12 : Multiplier port map(
    A=>nn3,
    B=>res1,
    S_out=>res2,
    C_out=>cc2
    );   
MUL13 : Multiplier port map(
    A=>nn4,
    B=>res2,
    S_out=>res3,
    C_out=>cc3
    ); 
MUL14 : Multiplier port map(
    A=>nn5,
    B=>res3,
    S_out=>res4,
    C_out=>cc4
    );   
MUL15 : Multiplier port map(
    A=>nn6,
    B=>res4,
    S_out=>res5,
    C_out=>cc5
    );
MUL16 : Multiplier port map(
    A=>nn7,
    B=>res5,
    S_out=>res6,
    C_out=>cc6
    );  
MUL17 : Multiplier port map(
    A=>nn8,
    B=>res6,
    S_out=>S,
    C_out=>cc7
    );
    C_Out<=(c1 or c2 or c3 or c4 or c5 or c6 or c7 or c8 or cc1 or cc2 or cc3 or cc4 or cc5 or cc6 or cc7);
end Behavioral;
