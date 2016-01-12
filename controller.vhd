library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;

entity controller is
  port( clk:in STD_LOGIC;
            DIN:out STD_LOGIC_VECTOR(7 downto 0);
            W: out STD_LOGIC;
            WADD: out STD_LOGIC_VECTOR(4 downto 0);
             Dataout:out std_logic_vector(3 downto 0);
             Control:out std_logic_vector(2 downto 0) );
end controller;

architecture controllerA of controller is
  signal counter: natural range 0 to 24;
  signal i_WADD   :  std_logic_vector( 4 downto 0 ):="00000"; 
  signal i_DIN    :  std_logic_vector( 7 downto 0 ):="00000000"; 
  signal i_W      :  std_logic:='0'; 



  begin

	 --conv_std_logic_vector(DIN,8);
	 --conv_std_logic_vector(WADD,6);
    --display: DisplayInterface port map(clk=>clk,DIN=>DIN,W=>W,WADD=>WADD,Dataout=>Dataout, Control=>Control);
	 --display: DisplayInterface port map(clk,DIN,W,WADD,dataout, control);
    process(CLK)
      --variable counter : integer := 0;
      begin
        if(rising_edge(CLK)) then --CLK ='1' and CLK'event
          counter<= counter + 1;
          case counter is
            WHEN 0 => i_W<='0';
            WHEN 1 =>  i_W<='1'; 
								i_WADD<="00000"; 
								i_DIN<=x"49";  --I
            WHEN 2 => i_W<='1'; i_WADD<="00001"; i_DIN<=x"20"; --
            WHEN 3 => i_W<='1'; i_WADD<="00010"; i_DIN<=x"41"; --A
            WHEN 4 => i_W<='1'; i_WADD<="00011"; i_DIN<=x"4D"; --M
            WHEN 5 => i_W<='1'; i_WADD<="00100"; i_DIN<=x"20"; --
            WHEN 6 => i_W<='1'; i_WADD<="00101"; i_DIN<=x"2E"; --.
            WHEN 7 => i_W<='1'; i_WADD<="00110"; i_DIN<=x"2E"; --.
            WHEN 8 => i_W<='1'; i_WADD<="00111"; i_DIN<=x"2E"; --.
            WHEN 9 => i_W<='1'; i_WADD<="10000"; i_DIN<=x"20"; --
            WHEN 10 => i_W<='1'; i_WADD<="10001"; i_DIN<=x"20"; --
            WHEN 11 => i_W<='1'; i_WADD<="10010"; i_DIN<=x"20"; --
            WHEN 12 => i_W<='1'; i_WADD<="10011"; i_DIN<=x"20"; --
            WHEN 13 => i_W<='1'; i_WADD<="10100"; i_DIN<=x"20"; --
            WHEN 14 => i_W<='1'; i_WADD<="10101"; i_DIN<=x"20"; --
            WHEN 15 => i_W<='1'; i_WADD<="10110"; i_DIN<=x"20"; --
            WHEN 16 => i_W<='1'; i_WADD<="10111"; i_DIN<=x"20"; --
            WHEN 17 => i_W<='1'; i_WADD<="11000"; i_DIN<=x"57"; --W
            WHEN 18 => i_W<='1'; i_WADD<="11001"; i_DIN<=x"4F"; --O
            WHEN 19 => i_W<='1'; i_WADD<="11010"; i_DIN<=x"52"; --R
            WHEN 20 => i_W<='1'; i_WADD<="11011"; i_DIN<=x"4B"; --K
            WHEN 21 => i_W<='1'; i_WADD<="11100"; i_DIN<=x"49"; --I
            WHEN 22 => i_W<='1'; i_WADD<="11101"; i_DIN<=x"4E"; --N
            WHEN 23 => i_W<='1'; i_WADD<="11110"; i_DIN<=x"47"; --G

            WHEN 24 => i_W<='1';
          end case;
        end if;
  end process;
  W<=i_W; WADD<=i_WADD; DIN<=i_DIN;
end controllerA;
