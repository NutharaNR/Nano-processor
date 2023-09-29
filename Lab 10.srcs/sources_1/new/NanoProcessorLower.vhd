----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/17/2022 07:39:39 PM
-- Design Name: 
-- Module Name: NanoProcessorLower - Behavioral
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

entity NanoProcessorLower is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           J_Flag : in STD_LOGIC;
           J_Address : in STD_LOGIC_VECTOR (3 downto 0);
           Ins_Bus : out STD_LOGIC_VECTOR (14 downto 0));
end NanoProcessorLower;

architecture Behavioral of NanoProcessorLower is
Component Prog_Counter
    port(  Clk : in STD_LOGIC;
           Push : in STD_LOGIC; --Push button
           TP : in STD_LOGIC_VECTOR (3 downto 0);  --From 2_way_4_bit_MUX
           MS : out STD_LOGIC_VECTOR (3 downto 0)); --to ROM and 4 bit adder
end Component;

Component MUX_2_way_4_bit
     port(S : in STD_LOGIC_VECTOR (3 downto 0);
          IMV : in STD_LOGIC_VECTOR (3 downto 0);
          LS : in STD_LOGIC;
          Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

Component RCA_4
    port(  MS : in STD_LOGIC_VECTOR (3 downto 0); -- memory select
           S : out STD_LOGIC_VECTOR (3 downto 0)); -- output to mux
end Component;

Component PROM
    port(  Input : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (14 downto 0));
end Component;

Signal MUX_in,PROM_in,NextRom : std_logic_vector(3 downto 0);

begin

ProgramCounter : Prog_Counter Port map(
    Clk => Clk,
    Push => Reset,
    TP => MUX_in,
    MS => PROM_in);
    
MUX_2_way_4_bit_1 : MUX_2_way_4_bit Port Map(
    S => NextRom,
    IMV => J_Address,
    LS => J_Flag,
    Y => MUX_in);
    
RCA : RCA_4 port map(
    MS => PROM_in,
    S => NextRom);

ProgROM : PROM port map(
    Input => PROM_in,
    Output => Ins_Bus);
end Behavioral;
