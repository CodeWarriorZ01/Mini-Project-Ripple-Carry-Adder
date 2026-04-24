library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_rca_8bit is
end tb_rca_8bit;

architecture behavior of tb_rca_8bit is

    signal a    : STD_LOGIC_VECTOR(7 downto 0);
    signal b    : STD_LOGIC_VECTOR(7 downto 0);
    signal cin  : STD_LOGIC;
    signal sum  : STD_LOGIC_VECTOR(7 downto 0);
    signal cout : STD_LOGIC;

begin

    -- Instantiate DUT
    uut: entity work.rca_8bit
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
        a <= "00000001";
        b <= "00000001";
        cin <= '0';
        wait for 10 ns;

        -- Test Case 2
        a <= "00001111";
        b <= "00000001";
        cin <= '0';
        wait for 10 ns;

        -- Test Case 3
        a <= "11111111";
        b <= "00000001";
        cin <= '0';
        wait for 10 ns;

        -- Test Case 4
        a <= "10101010";
        b <= "01010101";
        cin <= '0';
        wait for 10 ns;

        -- Test Case 5
        a <= "11110000";
        b <= "00001111";
        cin <= '1';
        wait for 10 ns;

        wait;
    end process;

end behavior;
