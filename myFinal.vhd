Library ieee;
Use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use Ieee.numeric_std.all;

entity myFinal is
port(
	clock, w, PBG, PBD, PB2, Resetn, pB, butT, but1, but2, but3, but4, senseP : in std_logic;
	z1, z2, LedPB,LedG, LedS, LedR, LedY : out std_logic;
	segm1, segm2, segm3, segm4 : out std_logic_vector(6 downto 0);
	count1 : out std_logic
	);

end myFinal;

Architecture SBehaviour of myFinal is

Type myState is (A, B, C, BD, D, E, F, BG, G, BT, T, ST, W2, BW3, W3, W21, W211, BW212, W212, W221, BW222, W222, W311, BW312, W312);

Signal y1, y2 : std_logic;

signal cnt : integer;

Signal y : myState;
begin 
	process(clock, Resetn) 
begin
	
	if (Resetn = '0') then
		y <= ST;
	elsif (clock'Event and clock = '1') then
	case y is
		when A =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
		if (but1 = '1' and but2 = '0' and but3 = '0') then 
		y <= B;
		elsif (but1 = '0' and but2 = '0' and but3 = '1') then
		y <= E;
		elsif (but1 = '0' and but2 = '1' and but3 = '0') then
		y <= W21;
		else y <= A;
		end if;
		end case;
		
	    when B =>
	    case senseP is
		when '1' => 
		y <= T;
		when '0' =>
	    if (but2 = '1' and but1 = '1' and but3 = '0') then 
		y <= C;
		elsif (but2 = '0' and but1 = '1' and but3 = '0') then
		y <= B;
		elsif (but2 = '0' and but1 = '1' and but3 = '1') then
		y <= W2;
		else  
		y <= A;
		end if;
		end case;
		
		when C =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
	    if (but3 = '1' and but1 = '1' and but2 = '1') then 
		y <= BD;
		elsif (but3 = '0' and but1 = '1' and but2 = '1') then
		y <= C;
		else 
		y <= A;
		end if;
		end case;
		
		when BD =>
		if (pB = '0') then
		y <= D;
		else 
		y <= BD;
		end if;
		
		when D =>
	    if (but3 = '1' and but1 = '1' and but2 = '1') then 
		y <= D;
		elsif (pBD = '0') then 
		y <= A;
		end if;
		
		when E =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
	    if (but1 = '1' and but2 = '0' and but3 = '1') then 
		y <= F;
		elsif (but1 = '0' and but2 = '0' and but3 = '1') then
		y <= E;
		elsif (but1 = '0' and but2 = '1' and but3 = '1') then
		y <= W311;
		else
		y <= A;
		end if;
		end case;
		
		when F =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
	    if (but1 = '1' and but2 = '1' and but3 = '1') then 
		y <= BG;
		elsif (but1 = '1' and but2 = '0' and but3 = '1') then
		y <= F;
		else
		y <= A;
		end if;
		end case;
		
		when BG =>
		if (pB = '0') then
		y <= G;
		else
		y <= BG;
		end if;
		
		when G =>
		case senseP is
		when '1' => 
		y <= G;
		when '0' => 
	    if (but1 = '1' and but2 = '1' and but3 = '1') then 
		y <= G;
		elsif (pBG = '0') then 
		y <= A;
		end if;
		end case;
		
		when W21 =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
	    if (but1 = '1' and but2 = '1' and but3 = '0') then 
		y <= W211;
		elsif (but1 = '0' and but2 = '1' and but3 = '1') then 
		y <= W221;
		else
		y <= W21;
		end if;
		end case;
		
		when W211 =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
		if (but1 = '1' and but2 = '1' and but3 = '1') then 
		y <= BW212;
		else
		y <= W211;
		end if;
		end case;
		
		when W221 =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
		if (but1 = '1' and but2 = '1' and but3 = '1') then 
		y <= BW222;
		else
		y <= W221;
		end if;
		end case;
		
		when BW212 =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
		if (pB = '0') then
		y <= W212;
		else
		y <= BW212;
		end if;
		end case;
		
		when W212 =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
		y <= W212;
		end case;
		
		when BW222 =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
		if (pB = '0') then
		y <= W222;
		else
		y <= BW222;
		end if;
		end case;
		
		when W222 =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
		y <= W222;
		end case;
		
		when W311 =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
		if (but1 = '1' and but2 = '1' and but3 = '1') then
		y <= BW312;
		else 
		y <= W311;
		end if;
		end case;
		
		when BW312 =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
		if (pB = '0') then
		y <= W312;
		else
		y <= BW312;
		end if;
		end case;
		
		when W312 =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
		y <= W312;
		end case;
		
		when W2 =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
		if (but1 = '1' and but2 = '1' and but3 = '1') then
		y <= BW3;
		else 
		y <= W2;
		end if;
		end case;
		
		when BW3 =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
		if (pB = '0') then
		y <= W3;
		else
		y <= BW3;
		end if;
		end case;
		
		when W3 =>
		case senseP is
		when '1' => 
		y <= T;
		when '0' => 
		y <= W3;
		end case;
		
		when BT =>
		if (senseP = '0') then
		y <= T;
		else
		y <= BT;	
		end if;
		
		when T =>
		if (PB2 = '0') then
		y <= A;
		else
		y <= T;	
		end if;
		when ST =>
		if (Resetn = '1') then
		y <= A;
		else 
		y <= ST;
		end if;
		
	end case;
	end if;
	end process;

	process(y)
	
	begin
	
	if (y = D) then
	segm2 <= "1000000";
	segm1 <= "1111001";
	segm3 <= "0111111";
	segm4 <= "1000001";
	elsif (y = G) then
	segm2 <= "1000000";
	segm1 <= "0100100";
	segm3 <= "0111111";
	segm4 <= "1000001";
	elsif (y = A) then
	segm1 <= "0000110";
	segm2 <= "0100001";
	segm3 <= "1000000";
	segm4 <= "1000110";
	elsif (y = B) then
	segm4 <= "1000000";
	segm3 <= "1111111";
	segm2 <= "1111111";
	segm1 <= "1111111";
	elsif (y = C) then
	segm4 <= "1000000";
	segm3 <= "1111001";
	segm2 <= "1111111";
	segm1 <= "1111111";
	elsif (y = E) then
	segm4 <= "0100100";
	segm3 <= "1111111";
	segm2 <= "1111111";
	segm1 <= "1111111";
	elsif (y = F) then
	segm4 <= "0100100";
	segm3 <= "1000000";
	segm2 <= "1111111";
	segm1 <= "1111111";
	elsif (y = BG) then
	segm4 <= "0100100";
	segm3 <= "1000000";
	segm2 <= "1111001";
	segm1 <= "1111111";
	elsif (y = BD) then
	segm4 <= "1000000";
	segm3 <= "1111001";
	segm2 <= "0100100";
	segm1 <= "1111111";
	elsif (y = BT) then 
	segm4 <= "0000111";
	segm3 <= "0001011";
	segm2 <= "1001111";
	segm1 <= "0001110";
	elsif (y = T) then 
	segm4 <= "0000111";
	segm3 <= "0001011";
	segm2 <= "1001111";
	segm1 <= "0001110";
	elsif (y = W21) then 
	segm4 <= "1111001";
	segm3 <= "1111111";
	segm2 <= "1111111";
	segm1 <= "1111111";
	elsif (y = W211) then 
	segm4 <= "1111001";
	segm3 <= "1000000";
	segm2 <= "1111111";
	segm1 <= "1111111";
	elsif (y = BW212) then 
	segm4 <= "1111001";
	segm3 <= "1000000";
	segm2 <= "0100100";
	segm1 <= "1111111";
	elsif (y = W212) then 
	segm4 <= "0000110";
	segm3 <= "0001111";
	segm2 <= "1000000";
	segm1 <= "0001111";
	elsif (y = W221) then 
	segm4 <= "1111001";
	segm3 <= "0100100";
	segm2 <= "1111111";
	segm1 <= "1111111";
	elsif (y = BW222) then 
	segm4 <= "1111001";
	segm3 <= "0100100";
	segm2 <= "1000000";
	segm1 <= "1111111";
	elsif (y = W222) then 
	segm4 <= "0000110";
	segm3 <= "0001111";
	segm2 <= "1000000";
	segm1 <= "0001111";
	elsif (y = W311) then 
	segm4 <= "0100100";
	segm3 <= "1111001";
	segm2 <= "1111111";
	segm1 <= "1111111";
	elsif (y = BW312) then 
	segm4 <= "0100100";
	segm3 <= "1111001";
	segm2 <= "1000000";
	segm1 <= "1111111";
	elsif (y = W312) then 
	segm4 <= "0000110";
	segm3 <= "0001111";
	segm2 <= "1000000";
	segm1 <= "0001111";
	elsif (y = W2) then 
	segm4 <= "1000000";
	segm3 <= "0100100";
	segm2 <= "1111111";
	segm1 <= "1111111";
	elsif (y = BW3) then 
	segm4 <= "1000000";
	segm3 <= "0100100";
	segm2 <= "1111001";
	segm1 <= "1111111";
	elsif (y = W3) then 
	segm4 <= "0000110";
	segm3 <= "0001111";
	segm2 <= "1000000";
	segm1 <= "0001111";
	elsif (y = ST) then 
	segm4 <= "1000000";
	segm3 <= "0001110";
	segm2 <= "0001110";
	segm1 <= "1111111";
	end if;
	
	end process;
	--z1 <= '1' when y = D else '0';
	--z2 <= '1' when y = G else '0';
	--LedR <= '1' when y = G else '0';
	LEDS <= '1' when (y = T) else '0';
	LedY <= '1' when (y = D or y = G) else '0';
	LedG <= '1' when (y = A or y = B or y = C or y = E or y = F)  else '0';
	LedPB <= '1' when pB = '0' else '0';
	--segm2 <= "1000100" when but3 = '1';
	--count1 <= std_logic_vector(cnt);
	
end SBehaviour;
		