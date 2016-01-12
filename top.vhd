----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:04:21 01/11/2016 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity top is
 port( clk:in STD_LOGIC;
		 Dataout:out std_logic_vector(3 downto 0);
		 Control:out std_logic_vector(2 downto 0) );
end top;

architecture Behavioral of top is
component DisplayInterface
				Port(clk:in STD_LOGIC;
            DIN:in STD_LOGIC_VECTOR(7 downto 0);
            W: in STD_LOGIC;
            WADD: in STD_LOGIC_VECTOR(4 downto 0);
            Dataout:out std_logic_vector(3 downto 0);
            Control:out std_logic_vector(2 downto 0));
end component;
component controller
				port( clk:in STD_LOGIC;
            DIN:out STD_LOGIC_VECTOR(7 downto 0);
            W: out STD_LOGIC;
            WADD: out STD_LOGIC_VECTOR(4 downto 0);
            Dataout:out std_logic_vector(3 downto 0);
            Control:out std_logic_vector(2 downto 0) );
end component; 

signal WADD   :  std_logic_vector( 4 downto 0 ):="00000"; 
signal DIN    :  std_logic_vector( 7 downto 0 ):="00000000"; 
signal W        :  std_logic:='0';
signal Dataout1  :  std_logic_vector(3 downto 0);
signal Control1  :  std_logic_vector(2 downto 0); 
begin

disp: DisplayInterface port map(clk=>clk,DIN=>DIN,W=>W,WADD=>WADD,Dataout=>Dataout, Control=>Control); --Dataout & Control...
cont: controller       port map(clk=>clk,DIN=>DIN ,W=>W ,WADD=>WADD ,Dataout=>Dataout1 ,Control=>Control1 );
end Behavioral;

