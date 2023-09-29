----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 05:18:55 PM
-- Design Name: 
-- Module Name: signed_divider - Behavioral
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

entity signed_divider is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S_out : out STD_LOGIC_VECTOR (7 downto 0);
           S_mod : out STD_LOGIC_VECTOR (7 downto 0));
end signed_divider;

architecture Behavioral of signed_divider is
component Divider port(
    A : in STD_LOGIC_VECTOR (7 downto 0);
    B : in STD_LOGIC_VECTOR (7 downto 0);
    S_out : out STD_LOGIC_VECTOR (7 downto 0);
    S_Mod : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
component RCA_8bit port (
    A : in STD_LOGIC_VECTOR (7 downto 0);
    B : in STD_LOGIC_VECTOR (7 downto 0);
    S_out : out STD_LOGIC_VECTOR (7 downto 0);
    C_in : in STD_LOGIC;
    C_out : out STD_LOGIC
    );
end component;
component Inverter Port  (
      B_in : in STD_LOGIC_VECTOR (7 downto 0);
      En : in STD_LOGIC;
      B_out : out STD_LOGIC_VECTOR (7 downto 0)
      );
end component;
SIGNAL sign,c_outA,c_outB,c_outMod,c_outOut : STD_LOGIC;
SIGNAL A_out,B_out,S_out0,S_mod0,A_rca,B_rca,mod_rca,out_rca : STD_LOGIC_VECTOR (7 downto 0);
begin
Divider_0 : Divider port map(
    A=>A_out,
    B=>B_out,
    S_out=>S_out0,
    S_mod=>S_mod0
    );
Inverter_A : Inverter port map(
    B_in=>A,
    En=>A(7),
    B_out=>A_rca
    );
Inverter_B : Inverter port map(
    B_in=>B,
    En=>B(7),
    B_out=>B_rca
    );
Inverter_mod : Inverter port map(
        B_in=>S_mod0,
        En=>sign,
        B_out=>mod_rca
        );
Inverter_out : Inverter port map(
            B_in=>S_out0,
            En=>sign,
            B_out=>out_rca
            );
RCA_A : RCA_8bit port map(
    A=>"00000000",
    B=>A_rca,
    C_in=>A(7),
    S_out=>A_out,
    C_out=>C_outA
    );
RCA_B : RCA_8bit port map(
    A=>"00000000",
    B=>B_rca,
    C_in=>B(7),
    S_out=>B_out,
    C_out=>C_outB
        );
RCA_mod : RCA_8bit port map(
        A=>"00000000",
        B=>mod_rca,
        C_in=>sign,
        S_out=>S_mod,
        C_out=>C_outMod
            );
 RCA_out : RCA_8bit port map(
        A=>"00000000",
        B=>out_rca,
        C_in=>sign,
        S_out=>S_out,
        C_out=>C_outout
            );
sign<= A(7) xor B(7);
end Behavioral;
