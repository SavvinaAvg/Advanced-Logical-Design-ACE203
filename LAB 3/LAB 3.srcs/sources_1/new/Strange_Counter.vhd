----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2020 14:17:16
-- Design Name: 
-- Module Name: StrangeCounter - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity StrangeCounter is
--  Port ( );
Port(
Clk : in std_logic;
RST : in std_logic;
Control : in std_logic_vector(2 downto 0);

Count : out std_logic_vector(7 downto 0);
Overflow : out std_logic;
Underflow : out std_logic;
Valid : out std_logic
);

end StrangeCounter;

architecture Behavioral of StrangeCounter is

signal CountTemp : std_logic_vector(7 downto 0);
signal OverflowTemp, UnderflowTemp, ValidTemp : std_logic;

begin

Process
begin

    WAIT UNTIL Clk'EVENT AND Clk = '1';

    if RST = '1' then 
        CountTemp <= "00000000";
        OverflowTemp <= '0';
        UnderflowTemp <= '0';
        ValidTemp <= '1';
        
     else
        if ValidTemp = '1' then 
        
            if Control = "000" then
            if CountTemp > 4 then
                CountTemp <= CountTemp - 5;
                else
                UnderflowTemp <= '1';
                ValidTemp <= '0';
                end if;
                
            elsif Control = "001" then 
             if CountTemp > 1 then
                CountTemp <= CountTemp - 2;
                 else
                UnderflowTemp <= '1';
                ValidTemp <= '0';
                end if;
                
            elsif Control = "010" then
                CountTemp <= CountTemp;
                
            elsif Control = "011" then
             if CountTemp < 255 then
                CountTemp <= CountTemp + 1;
                 else
                OverflowTemp <= '1';
                ValidTemp <= '0';
                end if;
                
            elsif Control = "100" then
             if CountTemp < 254 then
                CountTemp <= CountTemp + 2;
                else
                OverflowTemp <= '1';
                ValidTemp <= '0';
                end if;
                
            elsif Control = "101" then
             if CountTemp < 251 then
                CountTemp <= CountTemp + 5;
                 else
                OverflowTemp <= '1';
                ValidTemp <= '0';
                end if;
                
            elsif Control = "110" then
            if CountTemp < 250 then
                CountTemp <= CountTemp + 6;
                 else
                OverflowTemp <= '1';
                ValidTemp <= '0';
                end if;
                
            else
            if CountTemp < 244 then
                CountTemp <= CountTemp + 12;
                 else
                OverflowTemp <= '1';
                ValidTemp <= '0';
                end if;
                
            end if;
            
            --if CountTemp < 0 then
            --UnderflowTemp <= '1';
            --ValidTemp <= '0';
            --end if;
            
            --if 255 < CountTemp then
            --OverflowTemp <= '1';
            --ValidTemp <= '0';
            --end if;
            
         else
            CountTemp <= CountTemp;
            OverflowTemp <= OverflowTemp;
            UnderflowTemp <= UnderflowTemp;
            ValidTemp <= ValidTemp;
        
        end if;
    end if;
    
end Process;

Count <= CountTemp;
Overflow <= OverflowTemp;
Underflow <= UnderflowTemp;
Valid <= ValidTemp;

end Behavioral;
