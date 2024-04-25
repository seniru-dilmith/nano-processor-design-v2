----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2024 15:39:35
-- Design Name: 
-- Module Name: Multiplier_4 - Behavioral
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

entity Multiplier_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Multiplier_4;

architecture Behavioral of Multiplier_4 is

component FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal b0a0, b0a1, b1a0, b0a2, b1a1, b2a0, b0a3, b1a2, b2a1, b3a0, b3a1, b2a2, b1a3, b3a2, b2a3, b3a3 : std_logic;
signal s_0_0, s_0_1, s_0_2, s_0_3, s_1_0, s_1_1, s_1_2, s_1_3, s_2_0, s_2_1, s_2_2, s_2_3, S_3_0, s_3_1, s_3_2, s_3_3: std_logic;
signal c_0_0, c_0_1, c_0_2, c_0_3, c_1_0, c_1_1, c_1_2, c_1_3, c_2_0, c_2_1, c_2_2, c_2_3, c_3_0, c_3_1, c_3_2, c_3_3: std_logic;

begin
    
    FA_0_0: FA port map(b0a1, b1a0, '0', s_0_0, c_0_0);
    FA_0_1: FA port map(b0a2, b1a1, c_0_0, s_0_1, c_0_1);
    FA_0_2: FA port map(b0a3, b1a2, c_0_1, s_0_2, c_0_2);
    FA_0_3: FA port map(b1a3, c_0_2, '0', s_0_3, c_0_3);
    FA_1_0: FA port map(s_0_1, b2a0, '0', s_1_0, c_1_0);
    FA_1_1: FA port map(s_0_2, b2a1, c_1_0, s_1_1, c_1_1);
    FA_1_2: FA port map(s_0_3, b2a2, c_1_1, s_1_2, c_1_2);
    FA_1_3: FA port map(c_0_3, b2a3, c_1_2, s_1_3, c_1_3);
    FA_2_0: FA port map(s_1_1, b3a0, '0', s_2_0, c_2_0);
    FA_2_1: FA port map(s_1_2, b3a1, c_2_0, s_2_1, c_2_1);
    FA_2_2: FA port map(s_1_3, b3a2, c_2_1, s_2_2, c_2_2);
    FA_2_3: FA port map(b3a3, c_1_3, c_2_2, s_2_3, c_2_3);
    
    b0a0 <= B(0) and A(0);
    b0a1 <= B(0) and A(1);
    b0a2 <= B(0) and A(2);
    b0a3 <= B(0) and A(3);
    b1a0 <= B(1) and A(0);
    b1a1 <= B(1) and A(1);
    b1a2 <= B(1) and A(2);
    b1a3 <= B(1) and A(3);
    b2a0 <= B(2) and A(0);
    b2a1 <= B(2) and A(1);
    b2a2 <= B(2) and A(2);
    b2a3 <= B(2) and A(3);
    b3a0 <= B(3) and A(0);
    b3a1 <= B(3) and A(1);
    b3a2 <= B(3) and A(2);
    b3a3 <= B(3) and A(3);
    
    Y(0) <= b0a0;
    Y(1) <= s_0_0;
    Y(2) <= s_1_0;
    Y(3) <= s_2_0;
    Y(4) <= s_2_1;
    Y(5) <= s_2_2;
    Y(6) <= s_2_3;
    Y(7) <= c_2_3;
    

end Behavioral;
