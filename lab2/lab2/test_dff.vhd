--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:45:30 09/18/2014
-- Design Name:   
-- Module Name:   C:/vhdl/lab2/test_dff.vhd
-- Project Name:  lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dff
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_dff IS
END test_dff;
 
ARCHITECTURE behavior OF test_dff IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dff
    PORT(
         clk : IN  std_logic;
         d : IN  std_logic;
         q : OUT  std_logic;
			r: in std_logic;
			s: in std_logic;
			notq: OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal d : std_logic := '0';
	signal r : std_logic := '1';
	signal s : std_logic := '1';

 	--Outputs
   signal q : std_logic;
	signal notq: std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dff PORT MAP (
          clk => clk,
          d => d,
          q => q,
			 s => s,
			 r => r,
			 notq => notq
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for clk_period*3;

      -- insert stimulus here 
		
		  d <= '1';
		  WAIT FOR clk_period;
		  r <= '0';
		  WAIT FOR clk_period/2;
		  r <= '1';
		  WAIT FOR clk_period / 2;
        WAIT FOR clk_period;
		  d <= '0';
		  WAIT FOR clk_period;
		  s <= '0';
		  WAIT FOR clk_period;
		  s <= '1';
		  WAIT FOR clk_period;
		  d <= '1';
		  WAIT FOR clk_period;
		  d <= '0';
		  WAIT FOR clk_period;

      wait;
   end process;

END;
