library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

entity controller is
  port( CLK     : IN std_logic;
        WADD    : OUT std_logic_vector( 5 downto 0 );
        DIN     : OUT std_logic_vector( 8 downto 0 );
        W       : OUT std_logic;
        dataout : OUT std_logic_vector( 3 downto 0 );
        control : OUT std_logic_vector( 2 downto 0 ) );
end controller;

architecture controllerA of controller is
  signal counter: natural range 0 to 24;
  component LCDI is
    Port( clk: IN std_logic;
            DIN: OUT std_logic_vector( 8 downto 0 );
            W: OUT std_logic;
            WADD: OUT std_logic_vector( 5 downto 0 ); 
            dataout: OUT std_logic_vector( 3 downto 0 ); 
            control: OUT std_logic_vector( 2 downto 0 ));
  end component;
  
  begin
    display: LCDI port map(clk, DIN,W,WADD, dataout, control);
    process(CLK)
      --variable counter : integer := 0;
      begin
        if(rising_edge(CLK)) then --CLK ='1' and CLK'event
          counter<= counter + 1;
          case counter is
            WHEN 0 => W<='0';
            WHEN 1 =>  W<='1'; WADD<="000000"; Din<=x"49";  --I
            WHEN 2 => W<='1'; WADD<="000001"; Din<=x"20"; --
            WHEN 3 => W<='1'; WADD<="000010"; Din<=x"41"; --A
            WHEN 4 => W<='1'; WADD<="000011"; Din<=x"4D"; --M
            WHEN 5 => W<='1'; WADD<="000100"; Din<=x"20"; --
            WHEN 6 => W<='1'; WADD<="000101"; Din<=x"2E"; --.
            WHEN 7 => W<='1'; WADD<="000110"; Din<=x"2E"; --.
            WHEN 8 => W<='1'; WADD<="000111"; Din<=x"2E"; --.
            WHEN 9 => W<='1'; WADD<="100000"; Din<=x"20"; --
            WHEN 10 => W<='1'; WADD<="100001"; Din<=x"20"; --
            WHEN 11 => W<='1'; WADD<="100010"; Din<=x"20"; --
            WHEN 12 => W<='1'; WADD<="100011"; Din<=x"20"; --
            WHEN 13 => W<='1'; WADD<="100100"; Din<=x"20"; --
            WHEN 14 => W<='1'; WADD<="100101"; Din<=x"20"; --
            WHEN 15 => W<='1'; WADD<="100110"; Din<=x"20"; --
            WHEN 16 => W<='1'; WADD<="100111"; Din<=x"20"; --
            WHEN 17 => W<='1'; WADD<="101000"; Din<=x"57"; --W
            WHEN 18 => W<='1'; WADD<="101001"; Din<=x"4F"; --O
            WHEN 19 => W<='1'; WADD<="101010"; Din<=x"52"; --R
            WHEN 20 => W<='1'; WADD<="101011"; Din<=x"4B"; --K
            WHEN 21 => W<='1'; WADD<="101100"; Din<=x"49"; --I
            WHEN 22 => W<='1'; WADD<="101101"; Din<=x"4E"; --N
            WHEN 23 => W<='1'; WADD<="101110"; Din<=x"47"; --G

            WHEN 24 => W<='1';
          end case;
        end if;
  end process;
end controllerA;
