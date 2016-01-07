library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;

entity controller is
  port( CLK     : IN std_logic;
        WADD    : OUT std_logic_vector( 4 downto 0 );
        DIN     : OUT std_logic_vector( 7 downto 0 );
        W       : OUT std_logic;
        dataout : OUT std_logic_vector( 3 downto 0 );
        control : OUT std_logic_vector( 2 downto 0 ) );
end controller;

architecture controllerA of controller is
  signal counter: natural range 0 to 24;
  signal WADD1    :  std_logic_vector( 4 downto 0 ):="00000";
  signal DIN1     :  std_logic_vector( 7 downto 0 ):="00000000";
  signal W1       :  std_logic:='0';
  component LCDI is
    Port( CLK     : IN std_logic;
			  WADD    : OUT std_logic_vector( 4 downto 0 );
			  DIN     : OUT std_logic_vector( 7 downto 0 );
			  W       : OUT std_logic;
			  dataout : OUT std_logic_vector( 3 downto 0 );
			  control : OUT std_logic_vector( 2 downto 0 ));
  end component;
  

  begin

	 --conv_std_logic_vector(DIN,8);
	 --conv_std_logic_vector(WADD,6);
    display: LCDI port map(clk=>clk,DIN=>DIN1,W=>W1,WADD=>WADD1,dataout=>dataout, control=>control);
	 --display: LCDI port map(clk,DIN,W,WADD,dataout, control);
    process(CLK)
      --variable counter : integer := 0;
      begin
        if(rising_edge(CLK)) then --CLK ='1' and CLK'event
          counter<= counter + 1;
          case counter is
            WHEN 0 => W1<='0';
            WHEN 1 =>  W1<='1'; 
								WADD1<="00000"; 
								Din1<=x"49";  --I
            WHEN 2 => W1<='1'; WADD1<="00001"; Din1<=x"20"; --
            WHEN 3 => W1<='1'; WADD1<="00010"; Din1<=x"41"; --A
            WHEN 4 => W1<='1'; WADD1<="00011"; Din1<=x"4D"; --M
            WHEN 5 => W1<='1'; WADD1<="00100"; Din1<=x"20"; --
            WHEN 6 => W1<='1'; WADD1<="00101"; Din1<=x"2E"; --.
            WHEN 7 => W1<='1'; WADD1<="00110"; Din1<=x"2E"; --.
            WHEN 8 => W1<='1'; WADD1<="00111"; Din1<=x"2E"; --.
            WHEN 9 => W1<='1'; WADD1<="10000"; Din1<=x"20"; --
            WHEN 10 => W1<='1'; WADD1<="10001"; Din1<=x"20"; --
            WHEN 11 => W1<='1'; WADD1<="10010"; Din1<=x"20"; --
            WHEN 12 => W1<='1'; WADD1<="10011"; Din1<=x"20"; --
            WHEN 13 => W1<='1'; WADD1<="10100"; Din1<=x"20"; --
            WHEN 14 => W1<='1'; WADD1<="10101"; Din1<=x"20"; --
            WHEN 15 => W1<='1'; WADD1<="10110"; Din1<=x"20"; --
            WHEN 16 => W1<='1'; WADD1<="10111"; Din1<=x"20"; --
            WHEN 17 => W1<='1'; WADD1<="11000"; Din1<=x"57"; --W
            WHEN 18 => W1<='1'; WADD1<="11001"; Din1<=x"4F"; --O
            WHEN 19 => W1<='1'; WADD1<="11010"; Din1<=x"52"; --R
            WHEN 20 => W1<='1'; WADD1<="11011"; Din1<=x"4B"; --K
            WHEN 21 => W1<='1'; WADD1<="11100"; Din1<=x"49"; --I
            WHEN 22 => W1<='1'; WADD1<="11101"; Din1<=x"4E"; --N
            WHEN 23 => W1<='1'; WADD1<="11110"; Din1<=x"47"; --G

            WHEN 24 => W1<='1';
          end case;
        end if;
  end process;
  W<=W1; WADD<=WADD1; Din<=Din1;
end controllerA;
