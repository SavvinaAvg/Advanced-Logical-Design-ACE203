library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MyMemory_tb is
end;

architecture bench of MyMemory_tb is

  component MyMemory
    PORT (
      clka : IN STD_LOGIC;
      wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      dina : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      douta : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  end component;

  signal clka: STD_LOGIC;
  signal wea: STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal addra: STD_LOGIC_VECTOR(3 DOWNTO 0);
  signal dina: STD_LOGIC_VECTOR(3 DOWNTO 0);
  signal douta: STD_LOGIC_VECTOR(3 DOWNTO 0) ;

constant clka_period : time := 10 ns;

begin

  uut: MyMemory port map ( clka  => clka,
                           wea   => wea,
                           addra => addra,
                           dina  => dina,
                           douta => douta );

  stimulus: process
  begin
  
    -- Put initialisation code here

  wea <= "0"; 
  addra <= "0000";
  dina <= x"F";
      wait for clka_period; 
      
    -- Put test bench stimulus code here
  wea <= "1"; 
   addra <= "0001";
  dina <= x"D";
      wait for clka_period; 
      
  addra <= "0010";
  dina <= x"D";
      wait for clka_period;    
      
  addra <= "0011";
  dina <= x"B";
      wait for clka_period;    
    
  dina <= x"2";
  addra <= "0010";
      wait for clka_period;    
      
  dina <= x"4";
  addra <= "0001";
      wait for clka_period;    
     
  dina <= x"6";
  addra <= "0000";
      wait for clka_period;    
   
     wea <= "0";   
  addra <= "0001";
  dina <= x"8";
      wait for clka_period;    
      
     wea <= "1";  
  addra <= "0010";
  dina <= x"A";
      wait for clka_period;    
            
    wait;
  end process;
  

clk_process :process
   begin
		clka <= '0';
		wait for clka_period/2;
		clka <= '1';
		wait for clka_period/2;
   end process;
 

end;