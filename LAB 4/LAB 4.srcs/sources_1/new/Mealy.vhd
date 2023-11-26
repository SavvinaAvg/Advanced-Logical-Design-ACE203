----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2020 20:24:17
-- Design Name: 
-- Module Name: Mealy - Behavioral
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

entity Mealy is
--  Port ( );
port(
CLK : in std_logic;
RST : in std_logic;
A : in std_logic;
B : in std_logic;
Control : out std_logic_vector(2 downto 0)
);
end Mealy;

architecture Behavioral of Mealy is

TYPE state IS(S0, S1, S2, S3);
signal mealyState : state;

begin
    Process
    begin
    WAIT UNTIL CLK'EVENT AND CLK = '1' ; 
    
    if RST = '0' then
        mealyState <= S0;
    else
        case mealyState is
                when S0 =>
                    if (A = '0' AND B = '0') OR (A = '1' AND B = '1') then
                        mealyState <= S0;
                    elsif A = '0' AND B ='1' then
                        mealyState <= S3;
                    else 
                        mealyState <= S1;
                     end if;   
                
                when S1 =>
                    if (A = '0' AND B = '0') OR (A = '1' AND B = '1') then
                        mealyState <= S1;
                    elsif A = '0' AND B ='1' then
                        mealyState <= S0;
                    else 
                        mealyState <= S2;
                     end if;   
                
                 when S2 =>
                    if (A = '0' AND B = '0') OR (A = '1' AND B = '1') then
                        mealyState <= S2;
                    elsif A = '0' AND B ='1' then
                        mealyState <= S1;
                    else 
                        mealyState <= S3;
                     end if;   
                 
                 when S3 =>
                    if (A = '0' AND B = '0') OR (A = '1' AND B = '1') then
                        mealyState <= S3;
                    elsif A = '0' AND B ='1' then
                        mealyState <= S2;
                    else 
                        mealyState <= S0;
                     end if;   
                 
                   --when S4 =>
                   -- if (A = '0' AND B = '0') OR (A = '1' AND B = '1') then
                    --    mealyState <= S4;
                    --elsif A = '0' AND B ='1' then
                      --  mealyState <= S3;
                    --else 
                     --   mealyState <= S0;
                    -- end if;   
                     
                    when others =>
                        mealyState <= S0;
              end case;
          end if;
    end Process;
  
  
  Control(0) <= '1' when (mealyState = S0 and A='1' and B='0') or
                         (mealyState = S1 and ((A='0' and B='0') or (A='1' and B='1'))) or
                         (mealyState = S2 and ((A='0' and B='1') or (A='1' and B='0'))) or
                         (mealyState = S3 and ((A='0' and B='0') or (A='1' and B='1'))) 
                         --(mealyState = S4 and A='0' and B='1')
                else '0';
                
  Control(1) <= '1' when (mealyState = S1 and A='1' and B='0') or
                         (mealyState = S2 and ((A='0' and B='0') or (A='1' and B='1') or (A='1' and B='0'))) or
                         (mealyState = S3 and ((A='0' and B='0') or (A='1' and B='1') or (A='0' and B='1'))) 
                         --(mealyState = S4 and A='0' and B='1')   
                else '0';
  
  Control(2) <= '1' when (mealyState = S0 and A='0' and B='1') or 
                         (mealyState = S3 and A='1' and B='0') 
                         --(mealyState = S4 and ((A='0' and B='0') or (A='1' and B='1'))) 
                else '0';


end Behavioral;
