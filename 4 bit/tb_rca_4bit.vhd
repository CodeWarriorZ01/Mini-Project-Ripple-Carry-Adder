library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_rca_4bit is
end tb_rca_4bit;

architecture behavior of tb_rca_4bit is

    -- DUT signals
    signal a    : STD_LOGIC_VECTOR(3 downto 0);
    signal b    : STD_LOGIC_VECTOR(3 downto 0);
    signal cin  : STD_LOGIC;
    signal sum  : STD_LOGIC_VECTOR(3 downto 0);
    signal cout : STD_LOGIC;

begin

    -- Instantiate Unit Under Test (UUT)
    uut: entity work.rca_4bit
        port map (
            a => a,
            b => b,
            cin => cin,
            sum => sum,
            cout => cout
        );

    -- Stimulus process
    stim_proc: process
    begin

        -- Test Case 1
        a <= "0001";
        b <= "0001";
        cin <= '0';
        wait for 10 ns;

        -- Test Case 2
        a <= "0101";
        b <= "0011";
        cin <= '0';
        wait for 10 ns;

        -- Test Case 3
        a <= "1111";
        b <= "0001";
        cin <= '0';
        wait for 10 ns;

        -- Test Case 4
        a <= "1010";
        b <= "0101";
        cin <= '1';
        wait for 10 ns;

        -- Test Case 5
        a <= "1111";
        b <= "1111";
        cin <= '1';
        wait for 10 ns;

        wait; -- stop simulation
    end process;

end behavior;
