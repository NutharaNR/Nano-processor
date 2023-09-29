----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 01:26:12 AM
-- Design Name: 
-- Module Name: MUX_8_way_4_bit - Behavioral
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

entity MUX_8_way_8_bit is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           RG_0 : in STD_LOGIC_VECTOR (7 downto 0);
           RG_1 : in STD_LOGIC_VECTOR (7 downto 0);
           RG_2 : in STD_LOGIC_VECTOR (7 downto 0);
           RG_3 : in STD_LOGIC_VECTOR (7 downto 0);
           RG_4 : in STD_LOGIC_VECTOR (7 downto 0);
           RG_5 : in STD_LOGIC_VECTOR (7 downto 0);
           RG_6 : in STD_LOGIC_VECTOR (7 downto 0);
           RG_7 : in STD_LOGIC_VECTOR (7 downto 0);
           --EN : in STD_LOGIC;  --NO USE
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end MUX_8_way_8_bit;

architecture Behavioral of MUX_8_way_8_bit is

component MUX_8_to_1

     Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
           
end component;

begin
MUX_8_to_1_0 : MUX_8_to_1
    port map(
        S => S,
        D(0) => RG_0(0),
        D(1) => RG_1(0),
        D(2) => RG_2(0),
        D(3) => RG_3(0),
        D(4) => RG_4(0),
        D(5) => RG_5(0),
        D(6) => RG_6(0),
        D(7) => RG_7(0),
        
        EN => '1',
        Y => Y(0)
    );

MUX_8_to_1_1 : MUX_8_to_1
    port map(
        S => S,
        D(0) => RG_0(1),
        D(1) => RG_1(1),
        D(2) => RG_2(1),
        D(3) => RG_3(1),
        D(4) => RG_4(1),
        D(5) => RG_5(1),
        D(6) => RG_6(1),
        D(7) => RG_7(1),
        
        EN => '1',
        Y => Y(1)
    );


MUX_8_to_1_2 : MUX_8_to_1
    port map(
        S => S,
        D(0) => RG_0(2),
        D(1) => RG_1(2),
        D(2) => RG_2(2),
        D(3) => RG_3(2),
        D(4) => RG_4(2),
        D(5) => RG_5(2),
        D(6) => RG_6(2),
        D(7) => RG_7(2),
        
        EN => '1',
        Y => Y(2)
    );


MUX_8_to_1_3 : MUX_8_to_1
    port map(
        S => S,
        D(0) => RG_0(3),
        D(1) => RG_1(3),
        D(2) => RG_2(3),
        D(3) => RG_3(3),
        D(4) => RG_4(3),
        D(5) => RG_5(3),
        D(6) => RG_6(3),
        D(7) => RG_7(3),
        
        EN => '1',
        Y => Y(3)
    );
    
MUX_8_to_1_4 : MUX_8_to_1
        port map(
            S => S,
            D(0) => RG_0(4),
            D(1) => RG_1(4),
            D(2) => RG_2(4),
            D(3) => RG_3(4),
            D(4) => RG_4(4),
            D(5) => RG_5(4),
            D(6) => RG_6(4),
            D(7) => RG_7(4),
            
            EN => '1',
            Y => Y(4)
        );
    
    MUX_8_to_1_5 : MUX_8_to_1
        port map(
            S => S,
            D(0) => RG_0(5),
            D(1) => RG_1(5),
            D(2) => RG_2(5),
            D(3) => RG_3(5),
            D(4) => RG_4(5),
            D(5) => RG_5(5),
            D(6) => RG_6(5),
            D(7) => RG_7(5),
            
            EN => '1',
            Y => Y(5)
        );
    
    
    MUX_8_to_1_6 : MUX_8_to_1
        port map(
            S => S,
            D(0) => RG_0(6),
            D(1) => RG_1(6),
            D(2) => RG_2(6),
            D(3) => RG_3(6),
            D(4) => RG_4(6),
            D(5) => RG_5(6),
            D(6) => RG_6(6),
            D(7) => RG_7(6),
            
            EN => '1',
            Y => Y(6)
        );
    
    
    MUX_8_to_1_7 : MUX_8_to_1
        port map(
            S => S,
            D(0) => RG_0(7),
            D(1) => RG_1(7),
            D(2) => RG_2(7),
            D(3) => RG_3(7),
            D(4) => RG_4(7),
            D(5) => RG_5(7),
            D(6) => RG_6(7),
            D(7) => RG_7(7),
            
            EN => '1',
            Y => Y(7)
        );

end Behavioral;