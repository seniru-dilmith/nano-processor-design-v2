----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2024 22:22:28
-- Design Name: 
-- Module Name: four_way_4_bit_mux - Behavioral
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

entity four_way_4_bit_mux is
    Port ( In0 : in STD_LOGIC_VECTOR (3 downto 0);
           In1 : in STD_LOGIC_VECTOR (3 downto 0);
           In2 : in STD_LOGIC_VECTOR (3 downto 0);
           In3 : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC_VECTOR (1 downto 0));
end four_way_4_bit_mux;

architecture Behavioral of four_way_4_bit_mux is

begin

process(In0, In1, In2, In3, Sel)
    begin
        case Sel is
            when "00" =>
                Output <= In0;
            when "01" =>
                Output <= In1;
            when "10" =>
                Output <= In2;
            when "11" =>
                Output <= In3;
            when others =>
                -- nothing to handle every possible situation is handled
        end case;
    end process;

end Behavioral;
