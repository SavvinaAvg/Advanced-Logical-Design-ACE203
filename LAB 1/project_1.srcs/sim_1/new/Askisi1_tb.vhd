library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Askisi1_tb is
end;

architecture bench of Askisi1_tb is

  component Askisi1
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
  end component;

  signal A: std_logic;
  signal B: std_logic;
  signal C0: std_logic;
  signal C1: std_logic;
  signal C2: std_logic;
  signal C3: std_logic;
  signal C4: std_logic;
  signal C5: std_logic;
  signal Result: std_logic_vector(5 downto 0) ;

begin

  uut: Askisi1 port map ( A      => A,
                          B      => B,
                          C0     => C0,
                          C1     => C1,
                          C2     => C2,
                          C3     => C3,
                          C4     => C4,
                          C5     => C5,
                          Result => Result );

  stimulus: process
  begin
  
    -- Put initialisation code here
    A  <= '0';
    B  <= '0';
    C0 <= '0';
    C1 <= '0';
    C2 <= '0';
    C3 <= '0';
    C4 <= '0';
    C5 <= '0';

    -- Put test bench stimulus code here
    
    A  <= '0';
    B  <= '0';
    C0 <= '0';
    C1 <= '0';
    C2 <= '0';
    C3 <= '0';
    C4 <= '0';
    C5 <= '0';
    
    wait for 10ns;
    
    A  <= '0';
    B  <= '1';
    C0 <= '0';
    C1 <= '0';
    C2 <= '0';
    C3 <= '0';
    C4 <= '0';
    C5 <= '0';
    
    wait for 10ns;
    
    A  <= '1';
    B  <= '0';
    C0 <= '0';
    C1 <= '0';
    C2 <= '0';
    C3 <= '0';
    C4 <= '0';
    C5 <= '0';
    
    wait for 10ns;
    
    A  <= '1';
    B  <= '1';
    C0 <= '0';
    C1 <= '0';
    C2 <= '0';
    C3 <= '0';
    C4 <= '0';
    C5 <= '0';
    
    wait for 10ns;
    
    A  <= '0';
    B  <= '0';
    C0 <= '1';
    C1 <= '1';
    C2 <= '1';
    C3 <= '1';
    C4 <= '1';
    C5 <= '1';
    
    wait for 10ns;
    
    A  <= '0';
    B  <= '1';
    C0 <= '1';
    C1 <= '1';
    C2 <= '1';
    C3 <= '1';
    C4 <= '1';
    C5 <= '1';
    
    wait for 10ns;
    
    A  <= '1';
    B  <= '0';
    C0 <= '1';
    C1 <= '1';
    C2 <= '1';
    C3 <= '1';
    C4 <= '1';
    C5 <= '1';
    
    wait for 10ns;
    
    A  <= '1';
    B  <= '1';
    C0 <= '1';
    C1 <= '1';
    C2 <= '1';
    C3 <= '1';
    C4 <= '1';
    C5 <= '1';
    
    wait;
  end process;


end;
  