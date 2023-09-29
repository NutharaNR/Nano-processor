----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/16/2022 05:08:16 AM
-- Design Name: 
-- Module Name: INS_DECO2 - Behavioral
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

entity INS_DECO2 is
    Port  (D : in STD_LOGIC_VECTOR (14 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);
           Show: out STD_LOGIC;
           LoSe : out STD_LOGIC;
           IMVal : out STD_LOGIC_VECTOR (7 downto 0);
           RegS1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegS2 : out STD_LOGIC_VECTOR (2 downto 0);
           AluSel : out STD_LOGIC_VECTOR (3 downto 0);
           RegChe : in STD_LOGIC_VECTOR (7 downto 0);
           JFlag : out STD_LOGIC;
           ZeroF : out STD_LOGIC;
           AddrJMP : out STD_LOGIC_VECTOR (3 downto 0));
end INS_DECO2;

architecture Behavioral of INS_DECO2 is
Component TWISTER port (
      IN1 : in STD_LOGIC_VECTOR (2 downto 0);
      IN2 : in STD_LOGIC_VECTOR (2 downto 0);
      OUT1 : out STD_LOGIC_VECTOR (2 downto 0);
      OUT2 : out STD_LOGIC_VECTOR (2 downto 0);
      TWI : in STD_LOGIC
      );
End Component;   
SIGNAl REG_SEL1,REG_SEL2 : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL TWI_0: STD_LOGIC;
begin
----Using Twister to Interchange values returned from Registers  in NEG Command-----------------
TW_01 : TWISTER port map(
    IN1=>REG_SEL1,
    IN2=>REG_SEl2,
    OUT1=>RegS1,
    OUT2=>RegS2,
    TWI=>TWI_0
    );

REG_SEL1<= D(10 downto 8);
REG_SEL2<= D(7 downto 5);
TWI_0 <= (NOT(D(14) and D(13) and D(12)) and D(11)) and (NOT(D(7) and D(6) and D(5)));
--ALU Selector using the K-Maps prepared ---------------------------------
AluSel(0)<= (NOT(D(14)) and NOT(D(12)) and D(11)) or (NOT(D(14)) and D(13) and D(11)) or (D(14) and D(13) and D(12)) or (D(13) and D(12) and D(11)) or (D(14) and D(13) and NOT(D(11))) or (D(14) and D(12) and NOT(D(11)));
AluSel(1) <= (NOT(D(14)) and D(13) and NOT(D(12))) or (D(14) and D(12) and D(11)) or (D(14) and NOT(D(13)) and NOT(D(12))) or (D(14) and NOT(D(13)) and (D(11)));
AluSel(2) <= (D(14) and NOT(D(13))) or (D(14) and D(12) and D(11)) or (D(13) and D(12) and D(11)) or (NOT(D(14)) and D(13) and D(12));
AluSel(3) <= (D(14) and D(13) and D(11)) or (D(14) and D(13) and D(11));

Show <= D(14) and not(D(13)) and not(D(12)) and not(D(11));
--------------------------------------------------------------------------
JFlag<=(NOT(D(14)) and NOT(D(13)) and D(12) and D(11)) and NOT(RegChe(3) or RegChe(2) or RegChe(1) or RegChe(0) or RegChe(4) or RegChe(5) or RegChe(6) or RegChe(7));
AddrJMP <= D(3 downto 0); --FOR ROM(0) TO ROM(15)--
IMVal <= D (7 downto 0);
LoSe<= NOT(D(14)) and NOT(D(13)) and D(12) and NOT(D(11));
RegEn<= D (10 downto 8);
end Behavioral;
