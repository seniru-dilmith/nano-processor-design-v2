----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2024 17:05:55
-- Design Name: 
-- Module Name: TB_Multiplier_4 - Behavioral
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
-- Seniru Dilmith
-- 27/02/2024
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

entity TB_Multiplier_4 is
--  Port ( );
end TB_Multiplier_4;

architecture Behavioral of TB_Multiplier_4 is

component Multiplier_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal A_tb, B_tb : STD_LOGIC_VECTOR(3 downto 0);
signal Y_tb : STD_LOGIC_VECTOR(7 downto 0);

begin

    UUT : Multiplier_4 port map(A_tb, B_tb, Y_tb);
    
    process
    begin
    
    -- Test 1
    A_tb <= "1011";
    B_tb <= "1101";
    wait for 100 ns;
    
    -- Test 2
    A_tb <= "1011";
    B_tb <= "0101";
    wait for 100 ns;
    
    wait;
    
    end process;

end Behavioral;
