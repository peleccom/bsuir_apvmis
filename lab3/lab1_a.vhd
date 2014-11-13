--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:39:42 10/02/2014
-- Design Name:   
-- Module Name:   D:/ucheba/lab/APVMiS/lab3/lab1_a.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dev_parr
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
USE std.textio.ALL;
USE ieee.std_logic_textio.ALL;

 
 
library work;
USE work.txt_util.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY lab1_a IS
END lab1_a;
 
ARCHITECTURE behavior OF lab1_a IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dev_parr
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         y : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
	file test_file : TEXT OPEN READ_MODE IS "test1.log";
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dev_parr PORT MAP (
          a => a,
          y => y
        );

   -- Stimulus process
   stim_proc: process
		variable file_status: file_open_status;
		variable current_line: line;
		variable test_value: std_logic_vector(7 downto 0);
		variable C: character;
		variable test_out: std_logic_vector(2 downto 0);
   begin	
			while not endfile(test_file) loop
					readline(test_file, current_line);
					read(current_line, test_value);
					a <= test_value;
					wait for 1ns;
					read(current_line, C);
					read(current_line, test_out);
					if y /= test_out then
						report "!!Error line(" & str(test_value)&") Got:" & str(y) & " expects:" & str(test_out);
					end if;
			end loop;

		
	
   end process;

END;
