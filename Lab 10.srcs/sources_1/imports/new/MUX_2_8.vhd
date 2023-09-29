----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/17/2022 03:52:17 PM
-- Design Name: 
-- Module Name: MUX_2_8 - Behavioral
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

entity MUX_2_8 is
    Port ( A1 : in STD_LOGIC_VECTOR (7 downto 0);
           A2 : in STD_LOGIC_VECTOR (7 downto 0);
           En : in STD_LOGIC;
           Sel : in STD_LOGIC;
           S_Out : out STD_LOGIC_VECTOR (7 downto 0));
end MUX_2_8;

architecture Behavioral of MUX_2_8 is

begin
S_out(0)<= En and ((A1(0) and (not Sel)) or (A2(0) and Sel));
S_out(1)<= En and ((A1(1) and (not Sel)) or (A2(1) and Sel));
S_out(2)<= En and ((A1(2) and (not Sel)) or (A2(2) and Sel));
S_out(3)<= En and ((A1(3) and (not Sel)) or (A2(3) and Sel));
S_out(4)<= En and ((A1(4) and (not Sel)) or (A2(4) and Sel));
S_out(5)<= En and ((A1(5) and (not Sel)) or (A2(5) and Sel));
S_out(6)<= En and ((A1(6) and (not Sel)) or (A2(6) and Sel));
S_out(7)<= En and ((A1(7) and (not Sel)) or (A2(7) and Sel));
end Behavioral;
