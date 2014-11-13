----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:27:17 09/16/2014 
-- Design Name: 
-- Module Name:    dev_if - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dev_if is
PORT (a: in std_logic_vector(7 downto 0);
		y: out std_logic_vector(2 downto 0)
		);
end dev_if;

architecture Behavioral of dev_if is

begin
process(a)
begin
	if a(7) = '1' then
		y <= "111";
	elsif a(6) = '1' then
		y <= "110";
	elsif a(5) = '1' then
		y <= "101";
	elsif a(4) = '1' then
		y <= "100";
	elsif a(3) = '1' then
		y <= "011";
	elsif a(2) = '1' then
		y <= "010";
	elsif a(1) = '1' then
		y <= "001";
	else
		y <= "000";
	end if;
end process;

end Behavioral;

