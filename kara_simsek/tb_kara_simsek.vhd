library IEEE;
use IEEE.STD_LOGIC_1164.all; -- We added std_logic_1164 package to use std_logic and std_logic_vector


entity tb_kara_simsek is
generic (length : integer :=8); --generic specifies at entity in testbench
end tb_kara_simsek;

architecture Behavioral of tb_kara_simsek is

component kara_simsek is -- We represent design source to simulation source
Port (

clk : in std_logic;
cikti : out std_logic_vector(length-1 downto 0)

 );
end component;

signal clk :  std_logic;  -- We created signals same name with input and output
signal cikti :  std_logic_vector(length-1 downto 0);

constant clock_period : time:=10ns; -- clock will complete one period in 10ns

begin

clk_process:process begin

clk<='1';
wait for clock_period/2;

clk<='0';
wait for clock_period/2;


end process;


uut: kara_simsek port map(

 clk      => clk   ,        
 cikti    => cikti 

);


end Behavioral;
