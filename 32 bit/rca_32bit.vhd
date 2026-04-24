library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rca_32bit is
    Port (
        a    : in  STD_LOGIC_VECTOR(31 downto 0);
        b    : in  STD_LOGIC_VECTOR(31 downto 0);
        cin  : in  STD_LOGIC;
        sum  : out STD_LOGIC_VECTOR(31 downto 0);
        cout : out STD_LOGIC
    );
end rca_32bit;

architecture Dataflow of rca_32bit is
    signal C : STD_LOGIC_VECTOR(32 downto 0);
begin

    -- Initial carry
    C(0) <= cin;

    -- Ripple Carry Logic
    gen_adder : for i in 0 to 31 generate
    begin
        sum(i) <= a(i) XOR b(i) XOR C(i);

        C(i+1) <= (a(i) AND b(i)) OR
                  (b(i) AND C(i)) OR
                  (a(i) AND C(i));
    end generate;

    -- Final carry out
    cout <= C(32);

end Dataflow;
