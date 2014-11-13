library ieee;
use ieee.std_logic_1164.all;

entity clock_divider is

  generic (
    divider : positive := 2);     

  port (
    clk : in  std_logic;        
    out_clk    : out std_logic);  
end entity clock_divider;

architecture implementation of clock_divider is
 signal ClockDiv : natural range 0 to divider := 0; 
 signal clk_out  : std_logic :='1';
begin 

 clock_div_p : process (clk) is

 begin
   if clk'event and clk = '1' then
     if (ClockDiv <  ((divider/2)-1)) then
       clk_out <= '1';
		 ClockDiv <= ClockDiv + 1;
		elsif (ClockDiv <  (divider-1)) then
			clk_out <= '0';
			 ClockDiv <= ClockDiv + 1;
     else
       clk_out <= '1';
       ClockDiv  <= 0;
     end if;
	end if;
 end process clock_div_p;

 out_clk <= clk_out;

end architecture implementation;