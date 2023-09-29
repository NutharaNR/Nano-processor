----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 11:02:40 AM
-- Design Name: 
-- Module Name: RegBank - Behavioral
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

entity RegBank is
    Port ( Clk : in STD_LOGIC;
           I : in STD_LOGIC_VECTOR (7 downto 0);
           Reset_in : in STD_LOGIC;
           RegEN : in STD_LOGIC_VECTOR (2 downto 0);
           Out_0 : out STD_LOGIC_VECTOR (7 downto 0);
           Out_1 : out STD_LOGIC_VECTOR (7 downto 0);
           Out_2 : out STD_LOGIC_VECTOR (7 downto 0);
           Out_3 : out STD_LOGIC_VECTOR (7 downto 0);
           Out_4 : out STD_LOGIC_VECTOR (7 downto 0);
           Out_5 : out STD_LOGIC_VECTOR (7 downto 0);
           Out_6 : out STD_LOGIC_VECTOR (7 downto 0);
           Out_7 : out STD_LOGIC_VECTOR (7 downto 0));
end RegBank;

architecture Behavioral of RegBank is
    component Decoder_3_to_8
        port( I : in STD_LOGIC_VECTOR (2 downto 0);
              Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component Reg
        port( D : in STD_LOGIC_VECTOR (7 downto 0);
              En : in STD_LOGIC;
              Clk : in STD_LOGIC;
              Q : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
   
    
    component Reset
        port(reset : in STD_LOGIC;
             I : out STD_LOGIC_VECTOR (7 downto 0);
             RegEN : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
signal Reg_EN : std_logic_vector ( 7 downto 0); 
signal Reg_EN_1 : std_logic_vector ( 7 downto 0); 
signal Reg_EN_2 : std_logic_vector ( 7 downto 0); 
signal I_0 : std_logic_vector (7 downto 0);
signal I_1 : std_logic_vector (7 downto 0);
signal D : std_logic_vector (7 downto 0):="00000000";
signal Inc : std_logic_vector (7 downto 0):="00000001";
signal Reg_EN_0:std_logic:='1';
begin

I_0 <= I AND I_1;


Decoder_3_to_8_0 : Decoder_3_to_8
    port map(
        I => RegEN,
        Y => Reg_EN_1);
        
Reset_0 : Reset
    port map(
        reset => Reset_in,
        I => I_1,
        RegEN => Reg_EN_2);
               

        
Reg_0 : Reg
    port map(
        D => D,
        EN => Reg_EN_0,
        Clk => Clk,
        Q => Out_0);
Reg_1 : Reg
    port map(
        D => Inc,
        EN => Reg_EN_0,
        Clk => Clk,
        Q => Out_1);
Reg_2 : Reg
    port map(
        D => I_0,
        EN => Reg_EN(2),
        Clk => Clk,
        Q => Out_2);
Reg_3 : Reg
    port map(
        D => I_0,
        EN => Reg_EN(3),
        Clk => Clk,
        Q => Out_3);
Reg_4 : Reg
    port map(
        D => I_0,
        EN => Reg_EN(4),
        Clk => Clk,
        Q => Out_4);
Reg_5 : Reg
    port map(
        D => I_0,
        EN => Reg_EN(5),
        Clk =>Clk,
        Q => Out_5);
Reg_6 : Reg
    port map(
        D => I_0,
        EN => Reg_EN(6),
        Clk => Clk,
        Q => Out_6);
Reg_7 : Reg
    port map(
        D => I_0,
        EN => Reg_EN(7),
        Clk => Clk,
        Q => Out_7);
        
Reg_EN <= Reg_EN_1 OR Reg_EN_2;

end Behavioral;
