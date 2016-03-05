	component unnamed is
		port (
			clk                : in  std_logic                     := 'X';             -- clk
			reset              : in  std_logic                     := 'X';             -- reset
			SPI_clk            : in  std_logic                     := 'X';             -- SPI_clk
			SPI_CS             : in  std_logic                     := 'X';             -- SPI_CS
			SPI_SDI            : in  std_logic                     := 'X';             -- SPI_SDI
			SPI_SDO            : out std_logic;                                        -- SPI_SDO
			data_out           : out std_logic_vector(7 downto 0);                     -- data_out
			data_out_enable    : out std_logic;                                        -- data_out_enable
			avs_s0_address     : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			avs_s0_read        : in  std_logic                     := 'X';             -- read
			avs_s0_readdata    : out std_logic_vector(31 downto 0);                    -- readdata
			avs_s0_write       : in  std_logic                     := 'X';             -- write
			avs_s0_writedata   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			avs_s0_waitrequest : out std_logic;                                        -- waitrequest
			ins_irq0_irq       : out std_logic                                         -- irq
		);
	end component unnamed;

	u0 : component unnamed
		port map (
			clk                => CONNECTED_TO_clk,                --    clock_sink.clk
			reset              => CONNECTED_TO_reset,              --    reset_sink.reset
			SPI_clk            => CONNECTED_TO_SPI_clk,            -- SPI_interface.SPI_clk
			SPI_CS             => CONNECTED_TO_SPI_CS,             --              .SPI_CS
			SPI_SDI            => CONNECTED_TO_SPI_SDI,            --              .SPI_SDI
			SPI_SDO            => CONNECTED_TO_SPI_SDO,            --              .SPI_SDO
			data_out           => CONNECTED_TO_data_out,           --              .data_out
			data_out_enable    => CONNECTED_TO_data_out_enable,    --              .data_out_enable
			avs_s0_address     => CONNECTED_TO_avs_s0_address,     --        avs_s0.address
			avs_s0_read        => CONNECTED_TO_avs_s0_read,        --              .read
			avs_s0_readdata    => CONNECTED_TO_avs_s0_readdata,    --              .readdata
			avs_s0_write       => CONNECTED_TO_avs_s0_write,       --              .write
			avs_s0_writedata   => CONNECTED_TO_avs_s0_writedata,   --              .writedata
			avs_s0_waitrequest => CONNECTED_TO_avs_s0_waitrequest, --              .waitrequest
			ins_irq0_irq       => CONNECTED_TO_ins_irq0_irq        --      ins_irq0.irq
		);

