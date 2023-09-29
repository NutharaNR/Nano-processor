----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/18/2022 11:21:59 AM
-- Design Name: 
-- Module Name: Divider_1bit - Behavioral
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

entity Divider_1bit is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S_out : out STD_LOGIC;
           S_mod : out STD_LOGIC_VECTOR (7 downto 0));
end Divider_1bit;

architecture Behavioral of Divider_1bit is
component MUX_2_way_8bit port(
    A : in STD_LOGIC_VECTOR (7 downto 0);
    B : in STD_LOGIC_VECTOR (7 downto 0);
    Sel : in STD_LOGIC;
    S_out : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
component RCA_8bit port(
    A : in STD_LOGIC_VECTOR (7 downto 0);
    B : in STD_LOGIC_VECTOR (7 downto 0);
    S_out : out STD_LOGIC_VECTOR (7 downto 0);
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
SIGNAL B_to,mod_out : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL c_out,NEG_Flag : STD_LOGIC;
begin
Inverter_0 : Inverter port map(
    B_in=>B,
    En=>'1',
    B_out=>B_to
    );
RCA_0 : RCA_8bit port map(
    A=>A,
    B=>B_to,
    S_out=>mod_out,
    C_in=>'1',
    C_out=>c_out
    );
MUX_0 : MUX_2_way_8bit port map(
    A=>A,
    B=>mod_out,
    Sel=>NEG_Flag,
    S_out=>S_mod
    );
NEG_Flag<=mod_out(7);
S_out<=not(NEG_Flag);
end Behavioral;
