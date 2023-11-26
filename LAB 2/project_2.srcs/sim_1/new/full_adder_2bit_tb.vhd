library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity full_adder_2bit_tb is
end;

architecture bench of full_adder_2bit_tb is

  component full_adder_2bit
      port (
          A: in std_logic_vector(1 downto 0);
          B: in std_logic_vector(1 downto 0);
          Cin : in std_logic;
          RESULT: out std_logic_vector(1 downto 0);
          Cout: out std_logic
      );
  end component;

  signal A: std_logic_vector(1 downto 0);
  signal B: std_logic_vector(1 downto 0);
  signal Cin: std_logic;
  signal RESULT: std_logic_vector(1 downto 0);
  signal Cout: std_logic ;

begin

  uut: full_adder_2bit port map ( A      => A,
                                  B      => B,
                                  Cin    => Cin,
                                  RESULT => RESULT,
                                  Cout   => Cout );

  stimulus: process
  begin
  
    -- Put initialisation code here
    A <= "00";
    B <= "00";
    Cin <= '0';

    -- Put test bench stimulus code here

    A <= "00";
    B <= "00";
    Cin <= '0';
    
    wait for 10ns;
    
    A <= "01";
    B <= "00";
    Cin <= '0';
   
   wait for 10ns;
   
    A <= "10";
    B <= "01";
    Cin <= '0';
   
   wait for 10ns;
   
    A <= "11";
    B <= "01";
    Cin <= '0';
    
    wait for 10ns;
    
    A <= "11";
    B <= "11";
    Cin <= '0';
    
    wait for 10ns;
   
    A <= "00";
    B <= "00";
    Cin <= '1';
    
    wait for 10ns;
   
    A <= "00";
    B <= "01";
    Cin <= '1';
    
    wait for 10ns;
   
    A <= "01";
    B <= "10";
    Cin <= '1';
    
    wait for 10ns;
   
    A <= "10";
    B <= "11";
    Cin <= '1';
    
    wait for 10ns;
   
    A <= "11";
    B <= "11";
    Cin <= '1';
   
    wait;
  end process;


end;
  