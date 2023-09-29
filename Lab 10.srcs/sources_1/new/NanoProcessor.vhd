----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/17/2022 05:02:32 PM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity NanoProcessor is
    Port ( Clk_in : in STD_LOGIC;
           Reset : in STD_LOGIC;
           OverFlow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Neg : out STD_LOGIC;
           S7_seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode_sig : out STD_LOGIC_VECTOR (3 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0));
           
end NanoProcessor;
 
architecture Behavioral of NanoProcessor is
component NanoProcessorUpper 
Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Ins_Bus : in STD_LOGIC_VECTOR (14 downto 0);
           J_Flag : out STD_LOGIC;
           J_Address : out STD_LOGIC_VECTOR (3 downto 0);
           OverFlow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Neg : out STD_LOGIC;
           S7_seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode_sig : out STD_LOGIC_VECTOR (3 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0));
           
end component;

component NanoProcessorLower
Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           J_Flag : in STD_LOGIC;
           J_Address : in STD_LOGIC_VECTOR (3 downto 0);
           Ins_Bus : out STD_LOGIC_VECTOR (14 downto 0));
end component;

component Reseter port (
       CLK : in STD_LOGIC;
       Reset_in : in STD_LOGIC;
       Reset_out : out STD_LOGIC
    );
end component;
component Slow_Clk port (
    Clk_in : in STD_LOGIC;
    Clk_out : out STD_LOGIC
    );
end component;

SIGNAL Reset_out,Clk,J_Flag : STD_LOGIC;
SIGNAL J_Address : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Ins_Bus : STD_LOGIC_VECTOR (14 downto 0);

begin
NPU : NanoProcessorUpper port map(
    Reset=>Reset_out,
    Clk=>Clk,
    Ins_Bus=>Ins_Bus,
    J_Flag=>J_Flag,
    J_Address=>J_Address,
    OverFlow=>OverFlow,
    Neg => Neg, 
    Zero=>Zero,
    S7_Seg => S7_Seg ,
    Anode_sig => Anode_sig,
    LED=> LED);
    
NPL : NanoProcessorLower port map(
    Reset=>Reset_out,
    Clk=>Clk,
    J_Flag=>J_Flag,
    J_Address=>J_Address,
    Ins_Bus=>Ins_Bus
    );
 Reseter_0 : Reseter port map(
    CLK=>Clk,
    Reset_in=>Reset,
    Reset_out=>Reset_out
    );
 Slow_Clock_0 : Slow_Clk port map (
    Clk_in=>Clk_in,
    Clk_out=>Clk
    );

end Behavioral;
