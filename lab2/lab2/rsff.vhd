----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:29:56 09/18/2014 
-- Design Name: 
-- Module Name:    rsff - Behavioral 
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

entity rsff is
PORT(
	s, r, : in std_vector;
	q, notq: out std_vector;
	
	
);

end rsff;

architecture Behavioral of rsff is
component dff is
Port (
		clk: in std_logic;
		d: in std_logic;
		s, r: in std_logic;
		q: out std_logic;
		notq: out std_logic
		);
end component;
signal r: std_logic;
signal s: std_logic;
signal clk: std_logic;



signal q: std_logic;
signal notq: std_logic;
begin
	dff_inst1: dff
	port map (
		clk => clk;
		q => q;
		notq => notq;
		);
		
	



end Behavioral;

