----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:52:49 09/17/2014 
-- Design Name: 
-- Module Name:    dev_parr2 - Behavioral 
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

entity dev_parr2 is
PORT (a: in std_logic_vector(7 downto 0);
		y: out std_logic_vector(2 downto 0)
		);
end dev_parr2;

architecture Behavioral of dev_parr2 is
begin

		y <= "111" when a(7) = '1' else
		"110" when a(6) = '1' else
		"101" when a(5) = '1' else
		"100" when a(4) = '1' else
		"011" when a(3) = '1' else
		"010" when a(2) = '1' else
		"001" when a(1) = '1' else "000";
end Behavioral;


