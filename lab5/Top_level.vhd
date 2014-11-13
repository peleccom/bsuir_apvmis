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
use work.Common.all;
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
	uart_rx: in std_logic;
	uart_tx: in std_logic;

	sysclk_p : in std_logic;
	sysclk_n : in std_logic;

	rotarysw : in std_logic_vector(2 downto 0)
);
end Top_level;

architecture Behavioral of Top_level is

	----------------------------------------------------------
	COMPONENT UART_RECEIVER
    PORT(
				rx : in std_logic;
				clk : in std_logic;
				data_out : out std_logic_vector (5 downto 0);
				rst: in std_logic;
				is_err: out std_logic;
				internal_state: out finit_state
        );
    END COMPONENT;
	 
	 COMPONENT CLOCK_DIVIDER
	 
		generic (
			divider : positive); 
		port (clk : in std_logic;
			out_clk : out std_logic);
    END COMPONENT;

   signal rx : std_logic := '0';
	signal clk: std_logic := '0';
	signal rst: std_logic;
	signal internal_state: finit_state;
	signal is_err : std_logic;
	
	signal divider_clk: std_logic := '0';
	-- out
	signal divider_out: std_logic;
	

 	--Outputs
   signal data_out: std_logic_vector(5 downto 0);
	-----------------------------------------------------------
	
	signal sysclk : std_logic := '0';
	--signal sclk_counter : std_logic_vector(31 downto 0) := x"00000000";
	--signal sclk_divider : std_logic_vector(31 downto 0) := x"02FAF080"; --"05F5E100"; --x"00064";
	--signal sclk : std_logic := '0';

begin
   uut: UART_RECEIVER PORT MAP (
	
			rx => rx,
			clk => clk,
			data_out => data_out,
			rst => rst,
			is_err => is_err,
			internal_state => internal_state
        );
		  
		  
	 uut_divider: CLOCK_DIVIDER 
	 GENERIC MAP (divider => 320)
	 PORT MAP (
			 clk => divider_clk ,
			 out_clk => divider_out
        );

	 rx <= uart_rx;
		
	
	divider_clk <= sysclk ;
	clk <= divider_out;
	
	
	ledsboard(0) <= is_err;
	ledsboard(1) <= '0';
	ledsboard(2) <= data_out(0);
	ledsboard(3) <= data_out(1);
	ledsmain(0) <= data_out(2);
	ledsmain(1) <= data_out(3);
	ledsmain(2) <= data_out(4);
	ledsmain(3) <= data_out(5);
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
	

end Behavioral;

