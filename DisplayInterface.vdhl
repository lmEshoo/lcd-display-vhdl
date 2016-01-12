entity DisplayInterface is
            Port(clk:in STD_LOGIC;
            DIN:in STD_LOGIC_VECTOR(7 downto 0);
            W: in STD_LOGIC;
            WADD: in STD_LOGIC_VECTOR(4 downto 0);
             Dataout:out std_logic_vector(3 downto 0);
             Control:out std_logic_vector(2 downto 0);
            end DisplayInterface;
 
architecture Behavioral of DisplayInterface is
Component LCDI is
                 port(clk:in STD_logic;
                        DIN:in STD_LOGIC_VECTOR(7 downto 0);
                        W: in STD_LOGIC;
                        WADD: in STD_LOGIC_VECTOR(4 downto 0);
                        dataout: out STD_LOGIC_VECTOR(3 downto 0);
                        control: out STD_LOGIC_VECTOR(2 downto 0));
end component LCDI;
begin
 
dev: LCDI Port map(clk=>clk,DIN=>DIN,W=>W,WADD=>WADD,dataout=>dataout,control=>control);
                       
end Behavioral;
