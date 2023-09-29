----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 09:41:56 PM
-- Design Name: 
-- Module Name: INS_DECO - Behavioral
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

entity INS_DECO is
    Port ( D : in STD_LOGIC_VECTOR (11 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);
           LoSe : out STD_LOGIC;
           IMVal : out STD_LOGIC_VECTOR (3 downto 0);
           RegS1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegS2 : out STD_LOGIC_VECTOR (2 downto 0);
           AddSel : out STD_LOGIC;
           RegChe : in STD_LOGIC_VECTOR (3 downto 0);
           JFlag : out STD_LOGIC;
           AddrJMP : out STD_LOGIC_VECTOR (2 downto 0));
end INS_DECO;

architecture Behavioral of INS_DECO is
component TWISTER port (
      IN1 : in STD_LOGIC_VECTOR (2 downto 0);
      IN2 : in STD_LOGIC_VECTOR (2 downto 0);
      OUT1 : out STD_LOGIC_VECTOR (2 downto 0);
      OUT2 : out STD_LOGIC_VECTOR (2 downto 0);
      TWI : in STD_LOGIC
    );
end component;
SIGNAl REG_SEL1,REG_SEL2 : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL TWI_0: STD_LOGIC;
begin
TW_01 : TWISTER port map(
    IN1=>REG_SEL1,
    IN2=>REG_SEl2,
    OUT1=>RegS1,
    OUT2=>RegS2,
    TWI=>TWI_0
    );
REG_SEL1<= D(9 downto 7);
REG_SEL2<= D(6 downto 4);
TWI_0<= not(D(11)) and D(10) and NOT(D(6) and D(5) and D(4));
AddSel<= NOT(D(11)) and D(10);
JFlag<=(D(11) and D(10)) and NOT(RegChe(3) or RegChe(2) or RegChe(1) or RegChe(0));
AddrJMP<=D (2 downto 0);
IMVal<= D (3 downto 0);
LoSe<= D(11) and NOT(D(10));
RegEn<= D (9 downto 7);
end Behavioral;
