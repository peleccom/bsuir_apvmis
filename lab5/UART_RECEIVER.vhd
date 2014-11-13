----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:26:57 11/10/2014 
-- Design Name: 
-- Module Name:    UART_RECEIVER - Behavioral 
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
use work.Common.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UART_RECEIVER is
	 generic (
			mult : positive := 16);    
     port ( 
		rx : in std_logic;
      clk : in std_logic;
		data_out : out std_logic_vector (5 downto 0) := (others => '0');
		rst: in std_logic;
		is_err: out std_logic := '0';
		internal_state: out finit_state
 );
end UART_RECEIVER;

architecture Behavioral of UART_RECEIVER is
signal start_count : std_logic;
signal c : integer range 0 to mult - 1;
begin






	process (clk)
	begin
	if (clk = '1' and clk'event) then
			  if (start_count = '1') then
							if (c < (mult -1)) then
								c <= c + 1;       
							else
								c <= 0;
							end if;
			  else c <= 0;
			  end if;
	end if;
	end process;






	process (clk, rst)
		variable state : finit_state;  
		variable data : std_logic_vector (5 downto 0);
		variable rx_previous : std_logic;
		begin
		if (rst = '0') then
		
			if (clk = '1' and clk'event) then

				if (rx_previous = '1' and rx = '0') then      
					start_count <= '1';
					rx_previous := rx;
				else rx_previous := rx;
				end if;

				if (c = mult / 2) then
					case (state) is
						when start =>
											  if (rx = '0') then      
													state := bit_0;
													internal_state <= bit_0;
													
											  else state := start;
													internal_state <= start;
													start_count <= '0';
											  end if;
						when bit_0 => 
											  data(0) := rx;        
											  state := bit_1;
											  internal_state <= bit_1;
						when bit_1 => 	  
											  data(1) := rx;
											  state := bit_2;
											  internal_state <= bit_2;
						when bit_2 =>    
											  data(2) := rx;
											  state := bit_3;
											  internal_state <= bit_3;
						when bit_3 =>    
											  data(3) := rx;
											  state := bit_4;
											  internal_state <= bit_4;
						when bit_4 => 
						                 data(4) := rx;
											  state := bit_5;
											  internal_state <= bit_5;
						when bit_5 => 
						                 data(5) := rx;
											  state := stop;
											  internal_state <= stop;
						when stop =>    
						               state := start;
											internal_state <= start;
											start_count <= '0';
											if (rx = '1') then          
											  data_out <= data; 
											  is_err <='0';
											else
												is_err <='1';
											end if;
					end case;
				end if;

			end if;
		else
			 state := start;
			 internal_state <= start;
			 start_count <= '0';
		end if;
	end process;



end Behavioral;

