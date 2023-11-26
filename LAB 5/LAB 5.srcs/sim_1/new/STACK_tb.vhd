library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity STACK_tb is
end;

architecture bench of STACK_tb is

  component STACK
      Port (
          CLK: IN STD_LOGIC;
          RST: IN STD_LOGIC;
          PUSH: IN STD_LOGIC;
          POP: IN STD_LOGIC;
          NUMBER_IN: IN STD_LOGIC_VECTOR(3 downto 0);
          NUMBER_OUT: OUT STD_LOGIC_VECTOR(3 downto 0);
          EMPTY: OUT STD_LOGIC;
          FULL: OUT STD_LOGIC;
          ALMOST_EMPTY: OUT STD_LOGIC;
          ALMOST_FULL: OUT STD_LOGIC
      );
  end component;

  signal CLK: STD_LOGIC;
  signal RST: STD_LOGIC;
  signal PUSH: STD_LOGIC;
  signal POP: STD_LOGIC;
  signal NUMBER_IN: STD_LOGIC_VECTOR(3 downto 0);
  signal NUMBER_OUT: STD_LOGIC_VECTOR(3 downto 0);
  signal EMPTY: STD_LOGIC;
  signal FULL: STD_LOGIC;
  signal ALMOST_EMPTY: STD_LOGIC;
  signal ALMOST_FULL: STD_LOGIC ;

constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: STACK port map ( CLK          => CLK,
                        RST          => RST,
                        PUSH         => PUSH,
                        POP          => POP,
                        NUMBER_IN    => NUMBER_IN,
                        NUMBER_OUT   => NUMBER_OUT,
                        EMPTY        => EMPTY,
                        FULL         => FULL,
                        ALMOST_EMPTY => ALMOST_EMPTY,
                        ALMOST_FULL  => ALMOST_FULL );

  stimulus: process
  begin
  
     -- Put initialisation code here
    RST <= '0';
    PUSH <= '1';
    POP <= '0';
    NUMBER_IN <= "1001";

    -- Put test bench stimulus code here
    RST <= '0';
    PUSH <= '1';
    POP <= '0';
    NUMBER_IN <= "0001";
 
    wait for clock_period;
    
    RST <= '1';
    PUSH <= '1';
    POP <= '0';
    NUMBER_IN <= "0001";
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10;
    
    PUSH <= '1';
    POP <= '0';
    NUMBER_IN <= "0010";
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10;
    
       PUSH <= '1';
    POP <= '0';
    NUMBER_IN <= "0011";
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10;   
    
    PUSH <= '1';
    POP <= '0';
    NUMBER_IN <= "0100";
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10;   
    
    PUSH <= '1';
    POP <= '0';
    NUMBER_IN <= "0101";
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10;   
    
    PUSH <= '1';
    POP <= '0';
    NUMBER_IN <= "0110";
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10;   
    
    PUSH <= '1';
    POP <= '0';
    NUMBER_IN <= "0111";
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10;   
    PUSH <= '1';
    POP <= '0';
    NUMBER_IN <= "1000";
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10;   
    PUSH <= '1';
    POP <= '0';
    NUMBER_IN <= "1001";
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10;   
    
    PUSH <= '1';
    POP <= '0';
    NUMBER_IN <= "1010";
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10;   
    
    PUSH <= '1';
    POP <= '0';
    NUMBER_IN <= "1011";
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10;   
    
    PUSH <= '1';
    POP <= '0';
    NUMBER_IN <= "1100";
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10;   
    
    PUSH <= '0';
    POP <= '1';
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10;   
    
     PUSH <= '0';
    POP <= '1';
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10; 
    
      PUSH <= '0';
    POP <= '1';
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10; 
    
      PUSH <= '0';
    POP <= '1';
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10; 
    
      PUSH <= '0';
    POP <= '1';
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10; 
    
      PUSH <= '0';
    POP <= '1';
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10; 
    
      PUSH <= '0';
    POP <= '1';
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10; 
    
      PUSH <= '0';
    POP <= '1';
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10; 
    
      PUSH <= '0';
    POP <= '1';
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10; 
    
      PUSH <= '0';
    POP <= '1';
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10; 
    
      PUSH <= '0';
    POP <= '1';
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10; 
    
      PUSH <= '0';
    POP <= '1';
 
    wait for clock_period;
    
    PUSH <= '0';
    POP <= '0';
 
    wait for clock_period*10; 
    
   
    stop_the_clock <= true;
    wait;
    
  end process;

  clocking: process
  begin
  while not stop_the_clock loop
		CLK <= '0';
		wait for clock_period/2;
		CLK <= '1';
		wait for clock_period/2;
		end loop;
		wait;
		
   end process;
   
end;
  