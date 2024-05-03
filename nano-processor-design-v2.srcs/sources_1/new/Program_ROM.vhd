----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.04.2024 22:16:10
-- Design Name: 
-- Module Name: Program_ROM - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (12 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is

type rom_type is array (0 to 8) of std_logic_vector(12 downto 0);

    signal Instructions : rom_type := (

        "0101110000010", --0  MOVI R7 , 2
        "0101100000011", --1  MOVI R6 , 3
        "0101010000101", --2  MOVI R5 , 5
        "1011111100000", --3  CMP R7 , R6
        "1001111100000", --4  MUL R7 , R6
        "0001111010000", --5  ADD R7 , R5
        "1101110000000", --6  SHL R7 , 1
        "1111110000000", --7  SHR R7 , 1
        "0110000000000"  --8  JZR R0 , 0
        
    );

begin

    data <= Instructions(to_integer(unsigned(address)));

end Behavioral;
