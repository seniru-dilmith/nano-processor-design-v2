----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.05.2024 19:48:47
-- Design Name: 
-- Module Name: L_Bit_Shift - Behavioral
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

entity L_Bit_Shift is
    Port ( Data_In : in STD_LOGIC_VECTOR (3 downto 0);
           Data_Out : out STD_LOGIC_VECTOR (3 downto 0));
end L_Bit_Shift;

architecture Behavioral of L_Bit_Shift is

begin

    Data_Out(0) <= '0';
    Data_Out(1) <= Data_In(0);
    Data_Out(2) <= Data_In(1);
    Data_Out(3) <= Data_In(2);

end Behavioral;
