--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:43:06 10/14/2014
-- Design Name:   
-- Module Name:   /media/D/Ucheba/9sem/lab/APVMiS/lab3/lab_test.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shift_reg
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
USE std.textio.ALL;
USE ieee.std_logic_textio.ALL;
USE ieee.std_logic_1164.ALL;


library work;
USE work.txt_util.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY lab_test IS
END lab_test;
 
ARCHITECTURE behavior OF lab_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift_reg
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         c : IN  std_logic;
         d : IN  std_logic;
         e : IN  std_logic;
         f : IN  std_logic;
         g : IN  std_logic;
         h : IN  std_logic;
         srclr : IN  std_logic;
         srck : IN  std_logic;
         srload : IN  std_logic;
         rck : IN  std_logic;
         ser : IN  std_logic;
         Qa : OUT  std_logic;
         Qb : OUT  std_logic;
         Qc : OUT  std_logic;
         Qd : OUT  std_logic;
         Qe : OUT  std_logic;
         Qf : OUT  std_logic;
         Qg : OUT  std_logic;
         Qh : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal c : std_logic := '0';
   signal d : std_logic := '0';
   signal e : std_logic := '0';
   signal f : std_logic := '0';
   signal g : std_logic := '0';
   signal h : std_logic := '0';
   signal srclr : std_logic := '0';
   signal srck : std_logic := '0';
   signal srload : std_logic := '0';
   signal rck : std_logic := '0';
   signal ser : std_logic := '0';

 	--Outputs
   signal Qa : std_logic;
   signal Qb : std_logic;
   signal Qc : std_logic;
   signal Qd : std_logic;
   signal Qe : std_logic;
   signal Qf : std_logic;
   signal Qg : std_logic;
   signal Qh : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
	file test_file : TEXT OPEN READ_MODE IS "lab2.log";
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift_reg PORT MAP (
          a => a,
          b => b,
          c => c,
          d => d,
          e => e,
          f => f,
          g => g,
          h => h,
          srclr => srclr,
          srck => srck,
          srload => srload,
          rck => rck,
          ser => ser,
          Qa => Qa,
          Qb => Qb,
          Qc => Qc,
          Qd => Qd,
          Qe => Qe,
          Qf => Qf,
          Qg => Qg,
          Qh => Qh
        );


 

   -- Stimulus process
   stim_proc: process
		variable file_status: file_open_status;
		variable current_line: line;
		variable test_value: std_logic_vector(7 downto 0);
		variable test_sygnals: std_logic_vector(4 downto 0);
		variable Chr: character;
		variable test_out: std_logic_vector(7 downto 0);
		variable real_out: std_logic_vector(7 downto 0);
   begin		
			while not endfile(test_file) loop
					readline(test_file, current_line);
					read(current_line, test_value);
					read(current_line, Chr);
					read(current_line, test_sygnals);
					read(current_line, Chr);
					read(current_line, test_out);
					
					a <= test_value(7);
					b <= test_value(6);
					c <= test_value(5);
					d <= test_value(4);
					e <= test_value(3);
					f <= test_value(2);
					g <= test_value(1);
					h <= test_value(0);
					
					
					srclr <= test_sygnals(4);
					srck <= test_sygnals(3);
					srload <= test_sygnals(2);
					rck <= test_sygnals(1);
					ser <= test_sygnals(0);
					
					wait for period;
					real_out(7) := Qa;
					real_out(6) := Qb;
					real_out(5) := Qc;
					real_out(4) := Qd;
					real_out(3) := Qe;
					real_out(2) := Qf;
					real_out(1) := Qg;
					real_out(0) := Qh;

					if real_out /= test_out then
						report "!!Error line(" & str(test_value)&" " & str(test_sygnals)& ") Got:" & str(real_out) & " expects:" & str(test_out);
					end if;
					wait for (period - 1 ns);
			end loop;
			wait for (period - 1 ns);
   end process;

END;
