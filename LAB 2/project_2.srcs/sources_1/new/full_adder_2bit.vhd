----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2020 03:45:47 PM
-- Design Name: 
-- Module Name: full_adder_2bit - Behavioral
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

entity full_adder_2bit is
--  Port ( );
    port (
        A: in std_logic_vector(1 downto 0);
        B: in std_logic_vector(1 downto 0);
        Cin : in std_logic;
        RESULT: out std_logic_vector(1 downto 0);
        Cout: out std_logic
    );
end full_adder_2bit;

architecture Behavioral of full_adder_2bit is
    
    component full_adder
        port(
            x,y,z: in std_logic;
            s,c: out std_logic
        ); 
     end component;
     
     signal hc: std_logic;
begin
     FA1: full_adder
        port map( x => A(0),
                  y => B(0),
                  z => Cin,
                  s => RESULT(0),
                  c => hc
                 );
                 
    FA2: full_adder
        port map (x => A(1),
                  y => B(1),
                  z => hc,
                  s => RESULT(1),
                  c => Cout      
        );

end Behavioral;
