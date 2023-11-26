library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity StrangeCounter_tb is
end;

architecture bench of StrangeCounter_tb is

  component StrangeCounter
  Port(
  Clk : in std_logic;
  RST : in std_logic;
  Control : in std_logic_vector(2 downto 0);
  Count : out std_logic_vector(7 downto 0);
  Overflow : out std_logic;
  Underflow : out std_logic;
  Valid : out std_logic
  );
  end component;

  signal Clk: std_logic;
  signal RST: std_logic;
  signal Control: std_logic_vector(2 downto 0);
  signal Count: std_logic_vector(7 downto 0);
  signal Overflow: std_logic;
  signal Underflow: std_logic;
  signal Valid: std_logic ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: StrangeCounter port map ( Clk       => Clk,
                                 RST       => RST,
                                 Control   => Control,
                                 Count     => Count,
                                 Overflow  => Overflow,
                                 Underflow => Underflow,
                                 Valid     => Valid );

  stimulus: process
  begin
  
    -- Put initialisation code here
    RST <= '1';
    Control <= "000";


    -- Put test bench stimulus code here
 RST <= '1';
    Control <= "101"; 

    wait for clock_period; 
    
    RST <= '0';
    Control <= "011";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "011";
    
    wait for clock_period;   
  
    RST <= '0'; 
    Control <= "010";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "001";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "000";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
     
    wait for clock_period; 
    
    RST <= '1'; 
    Control <= "111"; 
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
  
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "111";
    
    wait for clock_period; 
  
    RST <= '1'; 
    Control <= "111";
    
    wait for clock_period; 
    
    RST <= '0'; 
    Control <= "101";
    
    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
     Clk <= '0';
		wait for clock_period/2;
		Clk <= '1';
		wait for clock_period/2;
    end loop;
    wait;
  end process;

end;
  