----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2020 03:19:09 PM
-- Design Name: 
-- Module Name: Control - Behavioral
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
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
--use IEEE.std_logic_signed.all;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Control is
--  Port ( );
Port(
    CLK: IN STD_LOGIC;
    RST: IN STD_LOGIC;
    Push : IN STD_LOGIC;
    Pop: IN STD_LOGIC;
    Empty: OUT STD_LOGIC;
    Full: OUT STD_LOGIC;
    AlmostEmpty: OUT STD_LOGIC;
    AlmostFull: OUT STD_LOGIC;
    Address: OUT STD_LOGIC_VECTOR(3 downto 0);
    WriteEnable: OUT STD_LOGIC_VECTOR(0 downto 0) 
);
end Control;


architecture Behavioral of Control is

TYPE state IS (sEmpty, sAlmostEmpty, sFull, sAlmostFull, sRegular);
SIGNAL Moore_state: state;
signal addr: std_logic_vector(3 downto 0) := "0000";
signal we: std_logic_vector(0 downto 0) := "0";

begin

process
begin

WAIT UNTIL CLK'EVENT AND CLK = '1' ; 

if (RST = '0') then
    Moore_state <= sEMPTY;
    addr <= "0000";
else
    case Moore_state is
    
    when sEMPTY =>
        
        if (Push = '1' and Pop = '0') then
            Moore_state <= sAlmostEmpty;
            addr <= addr + 1;
            we(0) <= '1';      
            
       end if;
            
     when sFull =>
    
        if (Push = '0' and Pop = '1') then
            Moore_state <= sAlmostFull;
            we(0) <= '0';
            addr <= addr - 1;
            
         end if;
            
     when sAlmostEmpty =>
     
        if (Push = '1' and Pop = '0') and (addr = "0011") then
            Moore_state <= sRegular;
            addr <= addr + 1;
            we(0) <= '1';
            
        elsif  (Push = '0' and Pop = '1') and addr = "0001" then
            Moore_state <= sEmpty;    
            we(0) <= '0';        
            addr <= addr - 1;

        else 
            Moore_state <= sAlmostEmpty;

            if (Push ='1' and Pop = '0') and (addr = "0010" or addr = "0001") then
                    addr <= addr + 1;
                    we(0) <= '1';
                    
            elsif (Push = '0' and Pop = '1') and (addr = "0010" or addr = "0011") then
                    we(0) <= '0';
                    addr <= addr - 1;
                   
         end if;
            end if; 
  
     when sAlmostFull =>
     
        if (Push = '0' and Pop = '1') and addr = "1000" then
            Moore_state <= sRegular;
            we(0) <= '0';
            addr <= addr - 1;
            
        elsif  (Push = '1' and Pop = '0') and addr = "1010" then
            Moore_state <= sFull;  
            addr <= addr + 1;  
            we(0) <= '1';
            
        else
            Moore_state <= sAlmostFull;

            if (Push ='1' and Pop = '0') and (addr = "1001" or addr = "1000") then
            addr <= addr + 1;  
            we(0) <= '1';
                    
            elsif (Push = '0' and Pop = '1') and (addr = "1001" or addr = "1010") then
            we(0) <= '0';
            addr <= addr - 1;  
            
            end if;
        
        end if; 
            
     when sRegular =>
     
        if (Push = '0' and Pop = '1') and addr = "0100" then
            Moore_state <= sAlmostEmpty;
            we(0) <= '0';        
            addr <= addr - 1;  
            
        elsif (Push = '1' and Pop = '0') and addr = "0111" then
            Moore_state <= sAlmostFull;
            addr <= addr + 1;  
            we(0) <= '1';
            
        else
            Moore_state <= sRegular;

            if(Push = '1' and Pop = '0') and (addr >= "0100" and addr <= "0110") then
                addr <= addr + 1;  
                we(0) <= '1';
                
            elsif (Push = '0' and Pop = '1') and (addr >= "0101" and addr <= "0111") then
                we(0) <= '0';
                addr <= addr - 1;  
                                     
                end if;

        end if;
            
end case;
       
end if;
end process;

    Address <= addr;
    Full <= '1' when (Moore_state = sFull)else '0';
    AlmostFull <= '1' when (Moore_state = sAlmostFull) else '0';
    Empty <= '1' when (Moore_state = sEmpty) else '0';
    AlmostEmpty <= '1' when (Moore_state = sAlmostEmpty) else '0';
    WriteEnable(0) <= we(0);
    
end Behavioral;
