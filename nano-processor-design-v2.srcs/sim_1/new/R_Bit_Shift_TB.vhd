----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.05.2024 19:50:45
-- Design Name: 
-- Module Name: R_Bit_Shift_TB - Behavioral
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

entity R_Bit_Shift_TB is
--  Port ( );
end R_Bit_Shift_TB;

architecture Behavioral of R_Bit_Shift_TB is


component R_Bit_Shift is
    Port ( Data_In : in STD_LOGIC_VECTOR (3 downto 0);
           Data_Out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Data_In_TB, Data_Out_TB : STD_LOGIC_VECTOR(3 downto 0);

begin

UUT : R_Bit_Shift port map (Data_In_TB, Data_Out_TB);

process
begin

    Data_In_TB <= "1010";
    wait for 10 ns;
    
    Data_In_TB <= "1011";
    wait for 10 ns;
    
    Data_In_TB <= "0111";
    wait for 10 ns;
    
    Data_In_TB <= "1111";
    wait for 10 ns;
    
    Data_In_TB <= "0010";
    wait;

end process;

end Behavioral;
