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
  component LCDI is
    Port( clk, Din, W, WADD, dataout, control );
  end component;
  variable counter : integer := 0;

  begin
    process(CLK)
      begin
        if(rising_edge(CLK)) then --CLK ='1' and CLK'event
          counter<= counter + 1;
          case counter is
            WHEN 0 => W<=1;
            WHEN 1 => W<=1; WADD<=5'b000000; Din=8'h49; --I
            WHEN 2 => W<=1; WADD<=5'b000001; Din=8'h20; --
            WHEN 3 => W<=1; WADD<=5'b000010; Din=8'h41; --A
            WHEN 4 => W<=1; WADD<=5'b000011; Din=8'h4D; --M
            WHEN 5 => W<=1; WADD<=5'b000100; Din=8'h20; --
            WHEN 6 => W<=1; WADD<=5'b000101; Din=8'h2E; --.
            WHEN 7 => W<=1; WADD<=5'b000110; Din=8'h2E; --.
            WHEN 8 => W<=1; WADD<=5'b000111; Din=8'h2E; --.
            WHEN 9 => W<=1; WADD<=5'b100000; Din=8'h20; --
            WHEN 10 => W<=1; WADD<=5'b100001; Din=8'h20; --
            WHEN 11 => W<=1; WADD<=5'b100010; Din=8'h20; --
            WHEN 12 => W<=1; WADD<=5'b100011; Din=8'h20; --
            WHEN 13 => W<=1; WADD<=5'b100100; Din=8'h20; --
            WHEN 14 => W<=1; WADD<=5'b100101; Din=8'h20; --
            WHEN 15 => W<=1; WADD<=5'b100110; Din=8'h20; --
            WHEN 16 => W<=1; WADD<=5'b100111; Din=8'h20; --
            WHEN 17 => W<=1; WADD<=5'b101000; Din=8'h57; --W
            WHEN 18 => W<=1; WADD<=5'b101001; Din=8'h4F; --O
            WHEN 19 => W<=1; WADD<=5'b101010; Din=8'h52; --R
            WHEN 20 => W<=1; WADD<=5'b101011; Din=8'h4B; --K
            WHEN 21 => W<=1; WADD<=5'b101100; Din=8'h49; --I
            WHEN 22 => W<=1; WADD<=5'b101101; Din=8'h4E; --N
            WHEN 23 => W<=1; WADD<=5'b101110; Din=8'h47; --G

            WHEN 24 => W<=1;
          end case;
        end if;
  end process;
end controllerA;
