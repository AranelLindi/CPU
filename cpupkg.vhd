library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package cpupkg is
    type alu_in_type is record
        -- Data in.
        di : std_logic_vector(15 downto 0);
        -- Accumulate Data input.
        ldacc : std_logic;
        -- Mode/Operation.
        mode : std_logic_vector(4 downto 0); -- (It is important, that "00000" is not associated to any mode otherwise ALU does operation in NOP round)
    end record alu_in_type;

    type alu_out_type is record
        -- Data out.
        do : std_logic_vector(15 downto 0);
        -- Valid data.
        valid : std_logic;
        -- Arithmetic Overflow.
        arov : std_logic;
    end record alu_out_type;
end package cpupkg;