--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:43:39 09/28/2014
-- Design Name:   
-- Module Name:   /media/D/Ucheba/9sem/lab/APVMiS/lab2/lab2/test_shift_req.vhd
-- Project Name:  lab2
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
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_shift_req IS
END test_shift_req;
 
ARCHITECTURE behavior OF test_shift_req IS 
 
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
         Qa, Qb, Qc, Qd, Qe, Qf, Qg, Qh : OUT  std_logic
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
   signal Qa,Qb,Qc,Qd,Qe,Qf,Qg, Qh : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
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
	 variable I :
      integer range 0 to 100;
   begin		
      -- hold reset state for 100 ns.
		-- wait for 2* period;
		srclr <= '0';
		srload <= '1';
		srck <= '0';
		rck <= '0';
		ser <= '1';
		
      wait for 3 * period;
		srclr <= '1';	
		wait for period;
		
		
		a <= '0';
		b <= '1';
		c <= '0';
		d <= '0';
		e <= '0';
		f <= '1';
		g <= '0';
		h <= '1';
		wait for period;
		rck <= '1';
		wait for period;
		rck <= '0';
		a <= '0';
		b <= '0';
		c <= '0';
		d <= '0';
		e <= '0';
		f <= '0';
		g <= '0';
		h <= '0';
		wait for 2 * period;
		srload <= '0';
		wait for period;
		wait for period;
		srload <= '1';
		wait for period;
		srck <= '1';
		wait for period;
		srck <= '0';
		wait for period;
		srck <= '1';
		wait for period;
		srck <= '0';
		wait for period;
		srck <= '1';
		wait for period;
		srck <= '0';
		ser <= '0';
		
		I := 0;
		  while (I <= 100) loop
				if (I mod 2 = 1) then
					srck <= '1';
				else
					srck <= '0';
				end if;
				I := I + 1;
				wait for period;
			end loop; 
		
		
		wait for period;
		
		
		
      wait;
   end process;

END;
