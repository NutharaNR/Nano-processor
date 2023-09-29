----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2022 09:38:16 AM
-- Design Name: 
-- Module Name: RCA8bit - Behavioral
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

entity RCA8bit is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0);
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC);
end RCA8bit;

architecture Behavioral of RCA8bit is
component RCA port(
           A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_out : out STD_LOGIC
    );
end component;
SIGNAL carryfrom : STD_LOGIC;
begin
RCA4_0 : RCA port map(
    A0=>A(0),
    A1=>A(1),
    A2=>A(2),
    A3=>A(3),
    B0=>B(0),
    B1=>B(1),
    B2=>B(2),
    B3=>B(3),
    C_in=>C_in,
    S0=>S(0),
    S1=>S(1),
    S2=>S(2),
    S3=>S(3),
    C_out=>carryfrom
    );
RCA4_1 : RCA port map(
        A0=>A(4),
        A1=>A(5),
        A2=>A(6),
        A3=>A(7),
        B0=>B(4),
        B1=>B(5),
        B2=>B(6),
        B3=>B(7),
        C_in=>carryfrom,
        S0=>S(4),
        S1=>S(5),
        S2=>S(6),
        S3=>S(7),
        C_out=>C_out
        );
end Behavioral;
