library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Control_tb is
end;

architecture bench of Control_tb is

  component Control
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
  end component;

  signal CLK: STD_LOGIC;
  signal RST: STD_LOGIC;
  signal Push: STD_LOGIC;
  signal Pop: STD_LOGIC;
  signal Empty: STD_LOGIC;
  signal Full: STD_LOGIC;
  signal AlmostEmpty: STD_LOGIC;
  signal AlmostFull: STD_LOGIC;
  signal Address: STD_LOGIC_VECTOR(3 downto 0);
  signal WriteEnable: STD_LOGIC_VECTOR(0 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: Control port map ( CLK         => CLK,
                          RST         => RST,
                          Push        => Push,
                          Pop         => Pop,
                          Empty       => Empty,
                          Full        => Full,
                          AlmostEmpty => AlmostEmpty,
                          AlmostFull  => AlmostFull,
                          Address     => Address,
                          WriteEnable => WriteEnable );

  stimulus: process
  begin
  
    -- Put initialisation code here

    RST <= '0';
    Push <= '1';
    Pop <= '0';
    
    -- Put test bench stimulus code here
    RST <= '0';
    Push <= '1';
    Pop <= '0';
    
    wait for clock_period;
    
    RST <= '1';
    Push <= '0';
    Pop <= '1';
    
     wait for clock_period;
    
    Push <= '1';
    Pop <= '0';
    
    wait for clock_period*10;
    
    Push <= '1';
    Pop <= '0';
    
    wait for clock_period*10;
    
    Push <= '0';
    Pop <= '1';
    
    wait for clock_period*10;
    
    Push <= '0';
    Pop <= '0';
    
    wait for clock_period;
    
    Push <= '1';
    Pop <= '1';
    
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