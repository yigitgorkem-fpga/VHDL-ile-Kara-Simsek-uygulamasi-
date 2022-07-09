library ieee;
use ieee.std_logic_1164.all; -- We added std_logic_1164 package to use std_logic,std_logic_vector and rising_edge

entity kara_simsek is -- output value cikti will change its value when clk at rising edge
generic (length : integer :=8); --uzunluk will corresponds to 8
Port (

clk : in std_logic; 
output : out std_logic_vector(length-1 downto 0)


 );
end kara_simsek;

architecture Behavioral of kara_simsek is

signal current_state : std_logic_vector(length-1 downto 0):="00000001";
-- current_state initialized as "00000001"

signal change_of_direction : std_logic:='1';
-- change_of_direction will use to change the flowing of light

begin


process(clk) begin
if (rising_edge(clk)) then
 
 if(change_of_direction='1') then -- when yondegisimi='1' MSB will trasfer to LSB
 
         current_state<=current_state(length-2 downto 0)& current_state(7) ;    
         if (current_state="01000000") then -- Change_of_direction takes '0' value when current_state="01000000"
          change_of_direction<='0';         -- If we take "10000000" instead of "01000000" simulation will repeat "00000001" and "10000000" respectively after current_state reach "10000000"
          else                              -- Because of parallel operations current_state takes "00000001" value while change_of_direction taking '0'  then in elsif block  because current_state = "00000001" change_of_direction take '1'
          change_of_direction<='1';         
                                            
         end if;                        
  
  
  elsif(change_of_direction='0') then -- when change_of_direction='0' LSB will trasfer to MSB
  
      current_state<=current_state(0)& current_state(length-1 downto 1) ;
      if (current_state="00000010") then
        change_of_direction<='1';
          else
        change_of_direction<='0';
      end if;
  
end if;
 
end if;
end process;

output<=current_state;

end Behavioral;
