----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:43:59 09/18/2014 
-- Design Name: 
-- Module Name:    dff - Behavioral 
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

entity dff is
Port (
		clk: in std_logic;
		d: in std_logic;
		s, r: in std_logic;
		q: out std_logic;
		notq: out std_logic
		);
		
end dff;

architecture Behavioral of dff is
		signal x: std_logic;
	begin
	process (clk, s, r) begin
	if (r = '0') then 
		x <= '0';
	elsif (s = '0') then 
		x <= '1';
	elsif (clk'event and clk = '0') then
		x <= d;
	end if;
	end process;
	q <= x;
	notq <= not x;
end Behavioral;

