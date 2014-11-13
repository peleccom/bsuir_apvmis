--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:59:23 11/10/2014
-- Design Name:   
-- Module Name:   /media/D/Ucheba/9sem/lab/APVMiS/lab5/UART_test.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UART_RECEIVER
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
use work.common.all;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY UART_test IS
END UART_test;
 
ARCHITECTURE behavior OF UART_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UART_RECEIVER
    PORT(
         rx : IN  std_logic;
         clk : IN  std_logic;
         data_out : OUT  std_logic_vector(5 downto 0);
			rst: IN std_logic;
			is_err: out std_logic;
			internal_state : out finit_state
        );
    END COMPONENT;
    

   --Inputs
   signal rx : std_logic := '0';
   signal clk : std_logic := '0';
	signal rst : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(5 downto 0);
	signal internal_state : finit_state;
	signal is_err : std_logic;
	
	
	signal clk2 : std_logic := '0';
   -- Clock period definitions
   constant clk_period : time := 10 ns;
	constant divided_clk_period : time := clk_period * 16;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UART_RECEIVER PORT MAP (
          rx => rx,
          clk => clk,
          data_out => data_out,
			 rst => rst,
			 is_err => is_err,
			 internal_state => internal_state
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
    
	 clk2_process :process
   begin
		clk2 <= '0';
		wait for divided_clk_period/2;
		clk2 <= '1';
		wait for divided_clk_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 2*clk_period;

      -- insert stimulus here 
		rx <= '1';
		wait for 2*divided_clk_period;
		rx <= '0';
		wait for divided_clk_period;
		-- transmit
		rx <= '1';
		wait for divided_clk_period;
		rx <= '0';
		wait for divided_clk_period;
		rx <= '1';
		wait for divided_clk_period;
		rx <= '0';
		wait for divided_clk_period;
		rx <= '1';
		wait for divided_clk_period;
		rx <= '1';
		wait for divided_clk_period;
		rx <= '1';
		wait for divided_clk_period;
		rx <= '1';
		wait for divided_clk_period;

		-- next
		rx <= '1';
		wait for 2 * divided_clk_period;
		rx <= '0';
		
		wait for divided_clk_period;
		rx <= '1';
		wait for divided_clk_period;
		rx <= '0';
		wait for divided_clk_period;
		rx <= '0';
		wait for divided_clk_period;
		rx <= '0';
		wait for divided_clk_period;
		rx <= '0';
		wait for divided_clk_period;
		rx <= '0';
		wait for divided_clk_period;
		rx <= '0';
		wait for clk_period/2;

		wait for divided_clk_period;
		rx <= '0';
--bit0
		wait for divided_clk_period;
		rx <= '1';		
		wait for divided_clk_period;
		rx <= '0';		
		wait for divided_clk_period;
		rx <= '0';		
		wait for divided_clk_period;
		rx <= '0';		
		wait for divided_clk_period;
		rx <= '0';		
		wait for divided_clk_period;
		rx <= '1';		
		wait for divided_clk_period;
		rx <= '1';		




		
     wait;
   end process;

END;
