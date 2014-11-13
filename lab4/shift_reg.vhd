----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:21:12 09/18/2014 
-- Design Name: 
-- Module Name:    shift_reg - Behavioral 
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

entity shift_reg is
PORT(
	a,b,c,d,e,f,g,h: in std_logic;
	srclr: in std_logic;
	srck: in std_logic;
	srload: in std_logic;
	rck: in std_logic;
	ser: in std_logic;
	Qa,Qb,Qc,Qd,Qe,Qf,Qg,Qh : out std_logic
);
end shift_reg;

architecture Behavioral of shift_reg is
component dff is 
Port (
		clk: in std_logic;
		d: in std_logic;
		s, r: in std_logic;
		q: out std_logic;
		notq: out std_logic
		);
end component;

signal d1_q: std_logic;
signal d1_notq: std_logic;

signal d2_q: std_logic;
signal d2_notq: std_logic;

signal d3_q: std_logic;
signal d3_notq: std_logic;

signal d4_q: std_logic;
signal d4_notq: std_logic;

signal d5_q: std_logic;
signal d5_notq: std_logic;

signal d6_q: std_logic;
signal d6_notq: std_logic;

signal d7_q: std_logic;
signal d7_notq: std_logic;


signal d8_q: std_logic;
signal d8_notq: std_logic;

signal d9_q: std_logic;
signal d9_notq: std_logic;

signal d10_q: std_logic;
signal d10_notq: std_logic;

signal d11_q: std_logic;
signal d11_notq: std_logic;

signal d12_q: std_logic;
signal d12_notq: std_logic;

signal d13_q: std_logic;
signal d13_notq: std_logic;


signal d14_q: std_logic;
signal d14_notq: std_logic;

signal d15_q: std_logic;
signal d15_notq: std_logic;

signal d16_q: std_logic;
signal d16_notq: std_logic;





signal rck_not: std_logic;

signal srload_not: std_logic;
signal srck_not: std_logic;

signal and_1: std_logic;
signal and_2: std_logic;

signal and_3: std_logic;
signal and_4: std_logic;

signal and_5: std_logic;
signal and_6: std_logic;

signal and_7: std_logic;
signal and_8: std_logic;


signal and_9: std_logic;
signal and_10: std_logic;

signal and_11: std_logic;
signal and_12: std_logic;

signal and_13: std_logic;
signal and_14: std_logic;


signal and_15: std_logic;
signal and_16: std_logic;


signal or_1, or_2, or_3, or_4, or_5, or_6, or_7, or_8: std_logic;



begin
rck_not <= not rck;
srload_not <= not srload;
srck_not <= not srck;


d1 : dff
port map(
	d => a,
	clk => rck_not,
	
	s => '1',
	r => '1',
	
	q => d1_q,
	notq => d1_notq
);

d2: dff
port map(
	d => b,
	clk => rck_not,
	
	s => '1',
	r => '1',
	
	q => d2_q,
	notq => d2_notq
);

d3: dff
port map(
	d => c,
	clk => rck_not,
	
	s => '1',
	r => '1',
	
	q => d3_q,
	notq => d3_notq
);

d4: dff
port map(
	d => d,
	clk => rck_not,
	
	s => '1',
	r => '1',
	
	q => d4_q,
	notq => d4_notq
);

d5: dff
port map(
	d => e,
	clk => rck_not,
	
	s => '1',
	r => '1',
	
	q => d5_q,
	notq => d5_notq
);

d6: dff
port map(
	d => f,
	clk => rck_not,
	
	s => '1',
	r => '1',
	
	q => d6_q,
	notq => d6_notq
);

d7: dff
port map(
	d => g,
	clk => rck_not,
	
	s => '1',
	r => '1',
	
	q => d7_q,
	notq => d7_notq
);


d8: dff
port map(
	d => h,
	clk => rck_not,
	
	s => '1',
	r => '1',
	
	q => d8_q,
	notq => d8_notq
);






 and_1 <= not(srload_not and d1_q);
 and_2 <= not(srload_not and d1_notq);
 
 
  and_3 <= not(srload_not and d2_q);
  and_4 <= not(srload_not and d2_notq);
 
 
  and_5 <= not(srload_not and d3_q);
  and_6 <= not(srload_not and d3_notq);
  
  and_7 <= not(srload_not and d4_q);
  and_8 <= not(srload_not and d4_notq);
  
  and_9 <= not(srload_not and d5_q);
  and_10 <= not(srload_not and d5_notq);
  
  
  and_11 <= not(srload_not and d6_q);
  and_12 <= not(srload_not and d6_notq);
	
	
  and_13 <= not(srload_not and d7_q);
  and_14 <= not(srload_not and d7_notq);
  
  and_15 <= not(srload_not and d8_q);
  and_16 <= not(srload_not and d8_notq);
	
  or_1 <= not ((not and_2) or (not srclr));
  
  or_2 <= not ((not and_4) or (not srclr));
  
  or_3 <= not ((not and_6) or (not srclr));
  
  or_4 <= not ((not and_8) or (not srclr));
  
  or_5 <= not ((not and_10) or (not srclr));
  
  or_6 <= not ((not and_12) or (not srclr));
  
  or_7 <= not ((not and_14) or (not srclr));
  
  or_8 <= not ((not and_16) or (not srclr));
 
	
 d9: dff
port map(
	d => ser,
	clk => srck_not,
	
	s => and_1,
	r => or_1,
	
	q => d9_q,
	notq => d9_notq
);
 
 

 d10: dff
port map(
	d => d9_q,
	clk => srck_not,
	
	s => and_3,
	r => or_2,
	
	q => d10_q,
	notq => d10_notq
);


 d11: dff
port map(
	d => d10_q,
	clk => srck_not,
	
	s => and_5,
	r => or_3,
	
	q => d11_q,
	notq => d11_notq
);



 d12: dff
port map(
	d => d11_q,
	clk => srck_not,
	
	s => and_7,
	r => or_4,
	
	q => d12_q,
	notq => d12_notq
);


 d13: dff
port map(
	d => d12_q,
	clk => srck_not,
	
	s => and_9,
	r => or_5,
	
	q => d13_q,
	notq => d13_notq
);




 d14: dff
port map(
	d => d13_q,
	clk => srck_not,
	
	s => and_11,
	r => or_6,
	
	q => d14_q,
	notq => d14_notq
);



 d15: dff
port map(
	d => d14_q,
	clk => srck_not,
	
	s => and_13,
	r => or_7,
	
	q => d15_q,
	notq => d15_notq
);

 d16: dff
port map(
	d => d15_q,
	clk => srck_not,
	
	s => and_15,
	r => or_8,
	
	q => d16_q,
	notq => d16_notq
);


 Qa <= d9_q; 

 Qb <= d10_q;

 Qc <= d11_q;

 Qd <= d12_q;

 Qe <= d13_q;

 Qf <= d14_q;

 Qg <= d15_q;  

 Qh <= not d16_notq;



end Behavioral;

