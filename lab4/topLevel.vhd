----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:26:50 10/16/2014 
-- Design Name: 
-- Module Name:    Top_level - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity Top_level is
Port(
	ledsmain : out std_logic_vector(3 downto 0);

	ledsboard : out std_logic_vector(3 downto 0);

	pushbuttons : in std_logic_vector(4 downto 0);

	dipswitch : in std_logic_vector(3 downto 0);

	sysclk_p : in std_logic;
	sysclk_n : in std_logic;

	rotarysw : in std_logic_vector(2 downto 0)
);
end Top_level;

architecture Behavioral of Top_level is

	----------------------------------------------------------
	COMPONENT Shift_reg
    PORT(
			a,b,c,d,e,f,g,h: in std_logic;
			srclr: in std_logic;
			srck: in std_logic;
			srload: in std_logic;
			rck: in std_logic;
			ser: in std_logic;
			Qa,Qb,Qc,Qd,Qe,Qf,Qg,Qh : out std_logic
        );
    END COMPONENT;

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
	-----------------------------------------------------------
	
	signal sysclk : std_logic := '0';
	signal sclk_counter : std_logic_vector(31 downto 0) := x"00000000";
	signal sclk_divider : std_logic_vector(31 downto 0) := x"02FAF080"; --"05F5E100"; --x"00064";
	signal sclk : std_logic := '0';

begin
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

	 a <= dipswitch(0);
	 b <= dipswitch(1);
	 c <= dipswitch(2);
	 d <= dipswitch(3);
	 e <= dipswitch(0);
	 f <= dipswitch(1);
	 g <= dipswitch(2);
	 h <= dipswitch(3);
          
	srclr <=not pushbuttons(0);
	process(sclk)
	begin
	if sclk'event and sclk='1' then
		if pushbuttons(1) = '1' then
			rck <= not rck;
		else
			rck <= '0';
		end if;
	end if;
	end process;
	
	
	process(sclk)
	begin
	if sclk'event and sclk='1' then
		if pushbuttons(3) = '1' then
			srck <= not srck;
		else
			srck <= '0';
		end if;
	end if;
	end process;
	
	--rck <= sclk when pushbuttons(1) = '1' else '0';
   srload <= not pushbuttons(2);
   -- srck <= sclk when pushbuttons(3) = '1' else '1';
   ser <= pushbuttons(4);
	
	
	ledsboard(0) <= Qa;
	ledsboard(1) <= Qb;
	ledsboard(2) <= Qc;
	ledsboard(3) <= Qd;
	ledsmain(0) <= Qe;
	ledsmain(1) <= Qf;
	ledsmain(2) <= Qg;
	ledsmain(3) <= Qh;
	--------------------------------------------------------
	
	IBUFDS_inst : IBUFDS
   generic map (
      DIFF_TERM => FALSE, -- Differential Termination 
      IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
      IOSTANDARD => "DEFAULT")
   port map (
      O => sysclk,  -- Buffer output
      I => sysclk_p,  -- Diff_p buffer input (connect directly to top-level port)
      IB => sysclk_n -- Diff_n buffer input (connect directly to top-level port)
   );
	
	process (sysclk)
	begin
	if sysclk'event and sysclk='1' then
		if sclk_counter = x"00000000" then
			sclk <= not sclk;
			sclk_counter <= sclk_divider;
		else
			sclk_counter <= sclk_counter - 1;
		end if;
	end if;
	end process;

end Behavioral;

