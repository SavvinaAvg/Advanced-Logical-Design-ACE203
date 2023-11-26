----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2020 01:55:46 PM
-- Design Name: 
-- Module Name: Askisi1 - Behavioral
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

entity Askisi1 is
--  Port ( );

    port (
        A: in std_logic;
        B: in std_logic;
        C0: in std_logic;
        C1: in std_logic;
        C2: in std_logic;
        C3: in std_logic;
        C4: in std_logic;
        C5: in std_logic;
        Result: out std_logic_vector(5 downto 0)
    );
    
end Askisi1;

architecture Behavioral of Askisi1 is

begin

     Result(0) <= (A NAND B) AND C0;
     Result(1) <= (A NOR B) AND C1;
     Result(2) <= (A AND B) AND C2;
     Result(3) <= (A XOR B) AND C3;
     Result(4) <= ((A AND B) OR ((NOT A) AND (NOT B))) AND C4;
     Result(5) <= (((NOT A) AND B) XOR ((NOT A) OR B)) AND C5;
       
end Behavioral;