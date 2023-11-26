----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2020 03:18:31 PM
-- Design Name: 
-- Module Name: STACK - Behavioral
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

entity STACK is

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

end STACK;

architecture Behavioral of STACK is

    component MyMemory 
    port(
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
    
    end component;
    
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
    
    signal addr: std_logic_vector(3 downto 0);
    signal we: std_logic_vector(0 downto 0);
    
begin
    
    Con: Control
        port map(CLK => CLK,
                 RST => RST,
                 Push => PUSH,
                 Pop => POP,
                 Empty => EMPTY,
                 Full => FULL,
                 AlmostEmpty => ALMOST_EMPTY,
                 AlmostFull => ALMOST_FULL,
                 Address => addr,
                 WriteEnable => we
        );
    
    MM: MyMemory
        port map(clka => CLK,
                 wea => we,
                 addra => addr,
                 dina => NUMBER_IN,
                 douta => NUMBER_OUT
    );
    
end Behavioral;
