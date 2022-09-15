library ieee;
use ieee.std_logic.all;
use ieee.numeric_std.all;

use work.cpupkg.all;

entity ALU is
    port (
        -- System clock.
        clk : in std_logic;

        -- Synchronous reset.
        rst : in std_logic;

        -- Input signals from CPU.
        alui : in alu_in_type;

        -- Output signals to CPU.
        aluo : out alu_out_type
    );
end entity ALU;

architecture ALU_arch of ALU is
    -- Registers
    type regs_type is record
        -- Accumulator value (Unsigned).
        accU : unsigned(15 downto 0);
        -- Accumulator value (Signed).
        accS : signed(15 downto 0);
        -- Data in buffer.
        di_buf : std_logic_vector(15 downto 0); -- TODO: neccessary ?
        -- Result buffer.
        do_buf : std_logic_vector(15 downto 0);
        -- Mode buffer.
        mode_buf : std_logic_vector(4 downto 0); -- TODO: might be that this doesn't even have to be five bits wide (because the operations of ALU is just a subset of full instruction set ?)
        -- Valid Data out.
        valid : std_logic;
    end type regs_type;

    -- Initial state
    constant regs_reset : regs_type := (
        accU <= (Others => '0');
        accS <= (Others => '0');
        di_buf <= (Others => '0');
        do_buf <= (Others => '0');
        mode_buf <= (Others => '0'); -- NOP
    );

    -- Registers
    signal r: regs_type := regs_reset;
    signal rin : regs_type;
begin
    -- Combinatorial process.
    process(r, rst, alui)
        variable v: regs_type;
    begin
        v := r;

        case v.mode_buf is
            when "00000" => -- NOP
                v.valid := '0'; -- no valid data

            when "00001" => -- ADDU
                
            when "00010" => -- ADDS
            when "00011" => -- SUBU
            when "00100" => -- SUBS
            when "00101" => -- MUL
            when "00110" => -- INC (Increment)
            when "00111" => -- DEC (Decrement)
            when "01000" => -- EQL (Equal)
            when "01001" => -- GT (greater than)
            when "01010" => -- LT (less than)
            when "01011" => -- bitwise NOT
            when "01100" => -- bitwise OR
            when "01101" => -- bitwise AND
            when "01110" => -- bitwise XOR
            when "01111" => -- bitwise NOR
            when "10000" => -- bitwise NAND
            when "10001" => -- bitwise XNOR
            when "10010" => -- Shift right
            when "10011" => -- Shift left
            when others => --
        end case;

        -- Synchronous reset.
        if rst = '1' then
            v := regs_reset;
        end if;

        -- Drive outputs.
        -- Note: the outputs are combinatorially dependent on certain inputs.
        

        -- Update registers.
        rin <= v;
    end process;

    -- Synchronous process;
    process(clk)
    begin
        if rising_edge(clk) then
            r <= rin;
        end if;
    end process;
end architecture ALU_arch;