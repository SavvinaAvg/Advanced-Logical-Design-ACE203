library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity half_adder_tb is
end;

architecture bench of half_adder_tb is

  component half_adder
      port(
          x,y : in std_logic;
          s,c : out std_logic
      );
  end component;

  signal x,y: std_logic;
  signal s,c: std_logic ;

begin

  uut: half_adder port map ( x => x,
                             y => y,
                             s => s,
                             c => c );

  stimulus: process
  begin
  
    -- Put initialisation code here
    x <= '0';
    y <= '0';

    -- Put test bench stimulus code here
    
    x <= '0';
    y <= '0';
    
    wait for 10ns;
    
    x <= '0';
    y <= '1';
    
    wait for 10ns;
    
    x <= '1';
    y <= '0';
    
    wait for 10ns;
    
    x <= '1';
    y <= '1';
    
    wait;
  end process;


end;