----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2024 13:45:10
-- Design Name: 
-- Module Name: Multilplier_2 - Behavioral
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

entity Multiplier_2 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplier_2;

architecture Behavioral of Multiplier_2 is

component FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal b0a0, b0a1, b1a0, b1a1, s1, s2 : std_logic;
signal c1, c2 : std_logic;

begin
 
    b0a0 <= B(0) and A(0);
    b0a1 <= B(0) and A(1);
    b1a0 <= B(1) and A(0);
    b1a1 <= B(1) and A(1);
    
    FA_0_0: FA port map(b1a0, b0a1, '0', s1, c1);
    FA_0_1: FA port map('0', b1a1, c1, s2, c2);
    
    Y(0) <= b0a0;
    Y(1) <= s1;
    Y(2) <= s2;
    Y(3) <= c2;
         
end Behavioral;
