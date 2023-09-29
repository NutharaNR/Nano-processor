----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/17/2022 05:36:51 PM
-- Design Name: 
-- Module Name: NanoProcessorUpper - Behavioral
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

entity NanoProcessorUpper is
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
           
end NanoProcessorUpper;

architecture Behavioral of NanoProcessorUpper is
component RegBank
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
end component;

component INS_DECO2
Port  (D : in STD_LOGIC_VECTOR (14 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);
           Show: out STD_LOGIC;
           LoSe : out STD_LOGIC;
           IMVal : out STD_LOGIC_VECTOR (7 downto 0);
           RegS1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegS2 : out STD_LOGIC_VECTOR (2 downto 0);
           AluSel : out STD_LOGIC_VECTOR (3 downto 0);
           RegChe : in STD_LOGIC_VECTOR (7 downto 0);
           JFlag : out STD_LOGIC;
           ZeroF : out STD_LOGIC;
           AddrJMP : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component ALU
Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Ins : in STD_LOGIC_VECTOR (3 downto 0);
           S_out : out STD_LOGIC_VECTOR (7 downto 0);
           L_out : out STD_LOGIC_VECTOR (7 downto 0);
           C_out : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Neg : out STD_LOGIC;
           Sel : out STD_LOGIC);
end component;

component MUX_2_way_8_bit
Port ( S : in STD_LOGIC_VECTOR (7 downto 0);
           IMV : in STD_LOGIC_VECTOR (7 downto 0);
           LS : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component MUX_8_way_8_bit
Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           RG_0 : in STD_LOGIC_VECTOR (7 downto 0);
           RG_1 : in STD_LOGIC_VECTOR (7 downto 0);
           RG_2 : in STD_LOGIC_VECTOR (7 downto 0);
           RG_3 : in STD_LOGIC_VECTOR (7 downto 0);
           RG_4 : in STD_LOGIC_VECTOR (7 downto 0);
           RG_5 : in STD_LOGIC_VECTOR (7 downto 0);
           RG_6 : in STD_LOGIC_VECTOR (7 downto 0);
           RG_7 : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component MUX_2_8 
Port ( A1 : in STD_LOGIC_VECTOR (7 downto 0);
           A2 : in STD_LOGIC_VECTOR (7 downto 0);
           En : in STD_LOGIC;
           Sel : in STD_LOGIC;
           S_Out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Out_unit 
Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           S7_seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode_sig : out STD_LOGIC_VECTOR (3 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0));
end component;

Signal RegEn0,RegSel1,RegSel2 : STD_lOGIC_VECTOR(2 downto 0);
Signal AddrJMP ,AluSel: STD_lOGIC_VECTOR(3 downto 0);
Signal RB0,RB1,RB2,RB3,RB4,RB5,RB6,RB7, InA,InB, I, S_out,IMVal,RegChe,L_Out,Out_in: STD_lOGIC_VECTOR(7 downto 0);
Signal LoadSel, ZeroF,C_Out,EN ,Sel,show: STD_LOGIC;

begin
InsDeco :INS_DECO2 port map(
           D => Ins_Bus,
           show => show,
           RegEn =>RegEn0,
           LoSe =>LoadSel,
           IMVal=>IMVal,
           RegS1 =>RegSel1,
           RegS2 =>RegSel2 ,
           AluSel => AluSel,
           RegChe => RegChe ,
           JFlag => J_Flag,
           ZeroF =>ZeroF ,
           AddrJMP =>AddrJMP
           );

MUX_8_way_8_bit_1 : MUX_8_way_8_bit port map(
    S => RegSel1,
    RG_0 => RB0,
    RG_1 => RB1,
    RG_2 => RB2,
    RG_3 => RB3,
    RG_4 => RB4,
    RG_5 => RB5,
    RG_6 => RB6,
    RG_7 => RB7,
    Y => InA);
    
MUX_8_way_8_bit_2 : MUX_8_way_8_bit port map(
        S => RegSel2,
        RG_0 => RB0,
        RG_1 => RB1,
        RG_2 => RB2,
        RG_3 => RB3,
        RG_4 => RB4,
        RG_5 => RB5,
        RG_6 => RB6,
        RG_7 => RB7,
        Y => InB); 
        
MUX_2_way_8_bit_0 : MUX_2_way_8_bit port map(
           S => S_out,
           IMV=> IMVal,
           LS=> LoadSel,
           Y=> I
    );
       
RegBank0 : RegBank port map(
            Clk => Clk,
            I => I,
            RegEN =>RegEn0,
            Reset_in => Reset,
            Out_0 => RB0,
            Out_1 => RB1,
            Out_2 => RB2,
            Out_3 => RB3,
            Out_4 => RB4,
            Out_5 => RB5,
            Out_6 => RB6,
            Out_7 => RB7);
            
ALU_0 : ALU port map(
           A => InA ,
           B => InB ,
           Ins => AluSel, 
           S_out => S_out,
           L_out => L_out ,
           C_out => C_Out ,
           Zero=>Zero,
           Neg => Neg ,
           Sel => Sel );
           
MUX_2_8_0 : MUX_2_8 port map(
      A1=> InA ,
      A2 => L_Out,
      EN => EN,
      Sel => Sel,
      S_out => Out_in  
      );
           
Out_Unit_0: Out_unit port map(
          A =>Out_in ,
          S7_seg => S7_seg ,
          Anode_sig => Anode_sig,
          LED => LED);

OverFlow <= C_out;         
EN <= show or sel;
J_Address <= AddrJMP;     
RegChe <= InA; -- this error 


end Behavioral;
