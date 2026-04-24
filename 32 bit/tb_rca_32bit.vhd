library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_rca_32bit is
end tb_rca_32bit;

architecture behavior of tb_rca_32bit is

    signal a, b : STD_LOGIC_VECTOR(31 downto 0);
    signal cin  : STD_LOGIC;
    signal sum  : STD_LOGIC_VECTOR(31 downto 0);
    signal cout : STD_LOGIC;

begin

    -- Instantiate the DUT
    uut: entity work.rca_32bit
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
        -- Test case 1
        a <= x"00000001";
        b <= x"00000001";
        cin <= '1';
        wait for 10 ns;

        -- Test case 2
        a <= x"0000000F";
        b <= x"00000001";
        cin <= '0';
        wait for 10 ns;

        -- Test case 3
        a <= x"FFFFFFFF";
        b <= x"00000001";
        cin <= '0';
        wait for 10 ns;

        -- Test case 4
        a <= x"AAAAAAAA";
        b <= x"55555555";
        cin <= '0';
        wait for 10 ns;

        wait;
    end process;

end behavior;
