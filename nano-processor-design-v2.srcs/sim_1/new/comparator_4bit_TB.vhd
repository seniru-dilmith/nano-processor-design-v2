----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2024 12:26:38 AM
-- Design Name: 
-- Module Name: comparator_4bit_TB - Behavioral
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

entity comparator_4bit_TB is
--  Port ( );
end comparator_4bit_TB;

architecture Behavioral of comparator_4bit_TB is

component Comparator_4bit
    Port ( Num1 : in STD_LOGIC_VECTOR (3 downto 0);
           Num2 : in STD_LOGIC_VECTOR (3 downto 0);
           GreaterThan : out STD_LOGIC;
           Equal : out STD_LOGIC;
           LesserThan : out STD_LOGIC;
           Num_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Num1_TB,Num2_TB, Num_out_TB : STD_LOGIC_VECTOR (3 downto 0);
signal Equal_TB,GreaterThan_TB,LesserThan_TB : STD_LOGIC;

begin

UUT : comparator_4bit port map(
            Num1 => Num1_TB,
            Num2 => Num2_TB,
            Equal => Equal_TB,
            GreaterThan => GreaterThan_TB,
            LesserThan => LesserThan_TB,
            Num_out => Num_out_TB);

process 
    begin
    
    Num1_TB <= "1111";
    Num2_TB <= "1011";
    wait for 10ns;
    
    Num1_TB <= "1111";
    Num2_TB <= "1111";
    wait for 10ns;
    
    Num1_TB <= "0111";
    Num2_TB <= "1011";
    wait for 10ns;      
    
    end process;
    
end Behavioral;
