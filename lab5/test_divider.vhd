--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:06:23 11/13/2014
-- Design Name:   
-- Module Name:   /media/D/Ucheba/9sem/lab/APVMiS/lab5_final2/lab5/test_divider.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clock_divider
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
 
ENTITY test_divider IS
END test_divider;
 
ARCHITECTURE behavior OF test_divider IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clock_divider
	 generic (
			divider : positive);
    PORT(
         clk : IN  std_logic;
         out_clk : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal out_clk : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clock_divider 
	GENERIC MAP (divider => 10)
	PORT MAP (
          clk => clk,
          out_clk => out_clk
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
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
