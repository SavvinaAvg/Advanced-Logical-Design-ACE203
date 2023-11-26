library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity full_adder_tb is
end;

architecture bench of full_adder_tb is

  component full_adder
      port(
          x,y,z : in std_logic;
          s,c : out std_logic
      );
  end component;

  signal x,y,z: std_logic;
  signal s,c: std_logic ;

begin

  uut: full_adder port map ( x => x,
                             y => y,
                             z => z,
                             s => s,
                             c => c );

  stimulus: process
  begin
  
    -- Put initialisation code here
    x <= '0';
    y <= '0';
    z <= '0';

    -- Put test bench stimulus code here
    
    x <= '0';
    y <= '0';
    z <= '0';
    
    wait for 10ns;
    
    x <= '0';
    y <= '0';
    z <= '1';
    
    wait for 10ns;
    
    x <= '0';
    y <= '1';
    z <= '0';
    
    wait for 10ns;
    
    x <= '0';
    y <= '1';
    z <= '1';
    
    wait for 10ns;
    
    x <= '1';
    y <= '0';
    z <= '0';
    
    wait for 10ns;
    
    x <= '1';
    y <= '0';
    z <= '1';
    
    wait for 10ns;
    
    x <= '1';
    y <= '1';
    z <= '0';
    
    wait for 10ns;
    
    x <= '1';
    y <= '1';
    z <= '1';
     
    wait;
  end process;

end;