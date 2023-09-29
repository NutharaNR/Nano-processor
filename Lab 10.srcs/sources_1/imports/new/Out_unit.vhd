----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/17/2022 12:32:11 PM
-- Design Name: 
-- Module Name: Out_unit - Behavioral
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

entity Out_unit is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           S7_seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode_sig : out STD_LOGIC_VECTOR (3 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0));
end Out_unit;

architecture Behavioral of Out_unit is
    component Anode 
     port(   A : in STD_LOGIC_VECTOR (7 downto 0);
              A_out : out STD_LOGIC_VECTOR (7 downto 0);
              Anode : out STD_LOGIC_VECTOR (3 downto 0));
     end component;
     
     component LUT_16_7
      port( Address : in STD_LOGIC_VECTOR (3 downto 0);
            Data : out STD_LOGIC_VECTOR (6 downto 0));
     end component;
     
signal A_out : std_logic_vector (7 downto 0);
signal S7_seg_in : std_logic_vector (3 downto 0);
signal S7_seg_out : std_logic_vector (6 downto 0) ;
signal Anode_out : std_logic_vector (3 downto 0);

begin
Anode_0:Anode port map(
    A => A,
    A_out =>A_out, 
    Anode => Anode_out); 
    
LUT_16_7_1 : LUT_16_7 port map (
    Address => S7_seg_in,
    Data => S7_seg_out);

process
begin

    Anode_sig <= Anode_out;
    S7_seg <= "1000000";
    LED <= A;    

    
    wait for 100ns;
    
    Anode_sig <= "1110";
    S7_seg_in <= A_out(3 downto 0) ;
    S7_seg <= S7_seg_out;
    wait for 100ns;
    
     
   Anode_sig <= "1101";
   S7_seg_in <= A_out(7 downto 4) ;
   S7_seg <= S7_seg_out;
   wait for 100ns;
    
end process;   

end Behavioral;
