----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:39:21 09/17/2014 
-- Design Name: 
-- Module Name:    dev_parr - Behavioral 
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

entity dev_parr is
PORT (a: in std_logic_vector(7 downto 0);
		y: out std_logic_vector(2 downto 0)
		);
end dev_parr;

architecture Behavioral of dev_parr is

begin

	y(2) <= (a(4) and not a(5) and not a(6) and not a(7)) or
			(a(5) and not a(6) and not a(7)) or
			(a(6) and not a(7)) or a(7);
			
	y(1) <= (a(2) and not a(3) and not a(4) and not a(5) and not a(6) and not a(7)) or
			(a(3) and not a(4) and not a(5) and not a(6) and not a(7)) or
			(a(6) and not a(7)) or a(7);
			
	y(0) <= (a(1) and not a(2) and not a(3) and not a(4) and not a(5) and not a(6) and not a(7)) or
			(a(3) and not a(4) and not a(5) and not a(6) and not a(7)) or
			(a(5) and not a(6) and not a(7)) or a(7);
end Behavioral;

