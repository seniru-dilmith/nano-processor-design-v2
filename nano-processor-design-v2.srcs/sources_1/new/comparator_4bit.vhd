----------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date: 02/26/2024 09:40:23 PM
-- Design Name:
-- Module Name: comparator_4bit - Behavioral
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

entity Comparator_4bit is
    Port ( Num1 : in STD_LOGIC_VECTOR (3 downto 0);
           Num2 : in STD_LOGIC_VECTOR (3 downto 0);
           GreaterThan : out STD_LOGIC;
           Equal : out STD_LOGIC;
           LesserThan : out STD_LOGIC;
           Num_out : out STD_LOGIC_VECTOR (3 downto 0));
end Comparator_4bit;

architecture Behavioral of Comparator_4bit is

begin

-- Combinational logic for the 4-bit comparator
GreaterThan <= '1' when Num1 > Num2 else '0';
Equal <= '1' when Num1 = Num2 else '0';
LesserThan <= '1' when Num1 < Num2 else '0';

Num_out <= Num1;


end Behavioral;
