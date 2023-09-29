----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/17/2022 07:52:25 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( MS : in STD_LOGIC_VECTOR (3 downto 0); -- memory select
           S : out STD_LOGIC_VECTOR (3 downto 0)); -- output to mux
end RCA_4;

architecture Behavioral of RCA_4 is

component FA
  Port ( A : in STD_LOGIC;
         B : in STD_LOGIC;
         C_in : in STD_LOGIC;
         S : out STD_LOGIC;
         C_out : out STD_LOGIC);
end component;

SIGNAL C1,C2 , C3,C4: STD_LOGIC;
begin

FA_0 : FA
   port map(
       A => MS(0),
       B => '1',
       C_in => '0',
       S => S(0),
       C_out => C1
   );
   
FA_1 : FA
    port map(
        A => MS(1),
        B => '0',
        C_in => C1,
        S => S(1),
        C_out => C2
    );
      
FA_2 : FA
     port map(
         A => MS(2),
         B => '0',
         C_in => C2,
         S => S(2),
         C_out => C3   
     );
     
FA_3 : FA
        port map(
            A => MS(3),
            B => '0',
            C_in => C3,
            S => S(3),
            C_out => C4 --THIS value is not relevent
        );


end Behavioral;
