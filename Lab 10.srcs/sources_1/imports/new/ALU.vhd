----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/17/2022 02:31:30 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Ins : in STD_LOGIC_VECTOR (3 downto 0);
           S_out : out STD_LOGIC_VECTOR (7 downto 0);
           L_out : out STD_LOGIC_VECTOR (7 downto 0);
           C_out : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Neg : out STD_LOGIC;
           Sel : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
component Power port(
    A : in STD_LOGIC_VECTOR (7 downto 0);
    B : in STD_LOGIC_VECTOR (7 downto 0);
    C_out : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR (7 downto 0));
end component;
component signed_divider port(
    A : in STD_LOGIC_VECTOR (7 downto 0);
    B : in STD_LOGIC_VECTOR (7 downto 0);
    S_out : out STD_LOGIC_VECTOR (7 downto 0);
    S_mod : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
component Multiplier port (
       A : in STD_LOGIC_VECTOR (7 downto 0);
       B : in STD_LOGIC_VECTOR (7 downto 0);
       S_out : out STD_LOGIC_VECTOR (7 downto 0);
       C_out : out STD_LOGIC);
end component;
component CMP port (
       Zero : in STD_LOGIC;
       Neg : in STD_LOGIC;
       S5 : out STD_LOGIC_VECTOR (7 downto 0);
       S6 : out STD_LOGIC_VECTOR (7 downto 0);
       S7 : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
component RCA8bit port(
    A : in STD_LOGIC_VECTOR (7 downto 0);
    B : in STD_LOGIC_VECTOR (7 downto 0);
    S : out STD_LOGIC_VECTOR (7 downto 0);
    C_in : in STD_LOGIC;
    C_out : out STD_LOGIC
    );
end component;
component Inverter port(
       B_in : in STD_LOGIC_VECTOR (7 downto 0);
       En : in STD_LOGIC;
       B_out : out STD_LOGIC_VECTOR (7 downto 0)
       );
end component;
component BitShifter port(
    A : in STD_LOGIC_VECTOR (7 downto 0);
    LR : in STD_LOGIC;
    S_out : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
component MUX_8_8 port(
    A0 : in STD_LOGIC_VECTOR (7 downto 0);
    A1 : in STD_LOGIC_VECTOR (7 downto 0);
    A2 : in STD_LOGIC_VECTOR (7 downto 0);
    A3 : in STD_LOGIC_VECTOR (7 downto 0);
    A4 : in STD_LOGIC_VECTOR (7 downto 0);
    A5 : in STD_LOGIC_VECTOR (7 downto 0);
    A6 : in STD_LOGIC_VECTOR (7 downto 0);
    A7 : in STD_LOGIC_VECTOR (7 downto 0);
    B : in STD_LOGIC_VECTOR (2 downto 0);
    S : out STD_LOGIC_VECTOR (7 downto 0)
    );
  
end component ;
component MUX_2_8
Port ( A1 : in STD_LOGIC_VECTOR (7 downto 0);
           A2 : in STD_LOGIC_VECTOR (7 downto 0);
           En : in STD_LOGIC;
           Sel : in STD_LOGIC;
           S_Out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

SIGNAL add,mul,div,modd,pow,gr,eq,greq,bs,S,inverted: STD_LOGIC_VECTOR(7 downto 0); 
SIGNAL addc,mulc,powc,z,bshift : STD_LOGIC;
SIGNAL ins1 : STD_LOGIC_VECTOR(2 downto 0);
begin
Inverter_0: Inverter port map(
    B_in=>B,
    En=>ins1(0),
    B_out=>inverted
    );
ADD_SUB : RCA8bit port map(
    A=>A,
    B=>inverted,
    S=>add,
    C_in=>Ins(0),
    C_out=>addc
    );
MULTIPLIER_0 : Multiplier port map(
    A=>A,
    B=>B,
    S_out=>mul,
    C_out=>mulc
    );
DIVIDER_0 : signed_divider port map(
    A=>A,
    B=>B,
    S_out=>div,
    S_mod=>modd
    );
POWER_0 : Power port map(
    A=>A,
    B=>B,
    S=>pow,
    C_out=>powc
    );
COMPARE_0 : CMP port map(
    Zero=>z,
    Neg=>add(0),
    S5=>gr,
    S6=>eq,
    S7=>greq
    );
BITSHIFTER_0 : Bitshifter port map(
    A=>A,
    LR=>bshift,
    S_out=>bs
    );
MUL_0 : MUX_8_8 port map (
    A0=>add,
    A1=>add,
    A2=>mul,
    A3=>div,
    A4=>modd,
    A5=>pow,
    A6=>bs,
    A7=>bs,
    B=>ins1,
    S=>S
    );
MUL_1 : MUX_8_8 port map (
    A0=>"00000000",
    A1=>"00000000",
    A2=>"00000000",
    A3=>"00000000",
    A4=>"00000000",
    A5=>gr,
    A6=>eq,
    A7=>greq,
    B=>ins1,
    S=>L_out
    );
 
 MUX_3 : MUX_2_8 port map(
     A1 =>S,
     A2 =>A,
     EN =>'1',
     S_Out => S_out,
     Sel => Ins(3)
 );      
        
    ins1<= Ins (2 downto 0);
    z <= not(add(0) or add(1) or add(2) or add(3) or add(4) or add(5) or add(6) or add(7));
    Zero<=z;
    Neg<=S(7);
    bshift <= not(Ins(0));
    Sel<= Ins(3);
    C_out<=addc or mulc or powc;
end Behavioral;
