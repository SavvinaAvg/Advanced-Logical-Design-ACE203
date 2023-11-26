library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Mealy_tb is
end;

architecture bench of Mealy_tb is

  component Mealy
  port(
  CLK : in std_logic;
  RST : in std_logic;
  A : in std_logic;
  B : in std_logic;
  Control : out std_logic_vector(2 downto 0)
  );
  end component;

  signal CLK: std_logic;
  signal RST: std_logic;
  signal A: std_logic;
  signal B: std_logic;
  signal Control: std_logic_vector(2 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: Mealy port map ( CLK     => CLK,
                        RST     => RST,
                        A       => A,
                        B       => B,
                        Control => Control );

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here
    RST <= '0';
    A <= '0';
    B <= '0';

    wait for clock_period; 
    
    RST <= '1';
    A <= '1';
    B <= '0';

    wait for clock_period; 

    A <= '0';
    B <= '1';

    wait for clock_period; 

    A <= '1';
    B <= '0';

    wait for clock_period; 

    A <= '0';
    B <= '1';

    wait for clock_period; 

    A <= '1';
    B <= '1';

    wait for clock_period; 

    A <= '0';
    B <= '1';

    wait for clock_period; 

    A <= '0';
    B <= '1';

    wait for clock_period; 

    A <= '1';
    B <= '0';

    wait for clock_period; 

    A <= '0';
    B <= '0';

    wait for clock_period; 
    RST <= '0';
    A <= '1';
    B <= '0';

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