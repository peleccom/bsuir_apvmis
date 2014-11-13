----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:58:13 09/15/2014 
-- Design Name: 
-- Module Name:    dev_case - Behavioral 
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

entity dev_case is
PORT (a: in std_logic_vector(7 downto 0);
		y: out std_logic_vector(2 downto 0)
		);
end dev_case;

architecture Behavioral of dev_case is
begin
process(a)
begin
		case a(7) is
			when '1' => y <= "111";
			when others =>
				case a(6) is
					when '1' => y <= "110";
					when others => 
					case a(5) is
						when '1' => y <= "101";
						when others => 
								case a(4) is
								when '1' => y <= "100";
								when others => 
									case a(3) is
											when '1' => y <= "011";
											when others => 
											
													case a(2) is
													when '1' => y <= "010";
													when others => 
																	case a(1) is
																		when '1' => y <= "001";
																		when others => y <= "000"; 
						
					
																	end case;
						
					
													end case;
						
					
												end case;
					
									end case;
					
								end case;
					
							end case;
					end case;
			end process;



end Behavioral;

