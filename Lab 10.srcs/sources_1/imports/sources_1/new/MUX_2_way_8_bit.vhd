----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 08:14:27 AM
-- Design Name: 
-- Module Name: MUX_2_way_4_bit - Behavioral
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

entity MUX_2_way_8_bit is
    Port ( S : in STD_LOGIC_VECTOR (7 downto 0);
           IMV : in STD_LOGIC_VECTOR (7 downto 0);
           LS : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end MUX_2_way_8_bit;

architecture Behavioral of MUX_2_way_8_bit is

component MUX_2_to_1
    Port ( S : in STD_LOGIC;
           IMV : in STD_LOGIC;
           LS : in STD_LOGIC;
           Y : out STD_LOGIC);
end component;

begin
MUX_1_to_2_0 : MUX_2_to_1
    port map(
        S => S(0),
        IMV => IMV(0),
        LS => LS,
        Y => Y(0)
    );
    
MUX_1_to_2_1 : MUX_2_to_1
    port map(
        S => S(1),
        IMV => IMV(1),
        LS => LS,
        Y => Y(1)
    );
        
MUX_1_to_2_2 : MUX_2_to_1
    port map(
        S => S(2),
        IMV => IMV(2),
         LS => LS,
         Y => Y(2)
       );
MUX_1_to_2_3 : MUX_2_to_1
     port map(
          S => S(3),
          IMV => IMV(3),
          LS => LS,
          Y => Y(3)
       );            
MUX_1_to_2_4 : MUX_2_to_1
     port map(
          S => S(4),
          IMV => IMV(4),
          LS => LS,
          Y => Y(4)
      );
           
MUX_1_to_2_5 : MUX_2_to_1
      port map(
          S => S(5),
          IMV => IMV(5),
          LS => LS,
          Y => Y(5)
      );
               
MUX_1_to_2_6 : MUX_2_to_1
      port map(
          S => S(6),
          IMV => IMV(6),
          LS => LS,
          Y => Y(6)
      );
 
 MUX_1_to_2_7 : MUX_2_to_1
      port map(
          S => S(7),
          IMV => IMV(7),
          LS => LS,
          Y => Y(7)
      );            

                

end Behavioral;