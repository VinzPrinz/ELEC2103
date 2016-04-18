	component DE0_LT24_SOPC is
		port (
			alt_pll_areset_conduit_export               : in    std_logic                     := 'X';             -- export
			alt_pll_c1_clk                              : out   std_logic;                                        -- clk
			alt_pll_c3_clk                              : out   std_logic;                                        -- clk
			alt_pll_locked_conduit_export               : out   std_logic;                                        -- export
			alt_pll_phasedone_conduit_export            : out   std_logic;                                        -- export
			background_mem_s2_address                   : in    std_logic_vector(12 downto 0) := (others => 'X'); -- address
			background_mem_s2_chipselect                : in    std_logic                     := 'X';             -- chipselect
			background_mem_s2_clken                     : in    std_logic                     := 'X';             -- clken
			background_mem_s2_write                     : in    std_logic                     := 'X';             -- write
			background_mem_s2_readdata                  : out   std_logic_vector(15 downto 0);                    -- readdata
			background_mem_s2_writedata                 : in    std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			background_mem_s2_byteenable                : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- byteenable
			clk_clk                                     : in    std_logic                     := 'X';             -- clk
			cyclonespi_spi_interface_SPI_clk            : in    std_logic                     := 'X';             -- SPI_clk
			cyclonespi_spi_interface_SPI_CS             : in    std_logic                     := 'X';             -- SPI_CS
			cyclonespi_spi_interface_SPI_SDI            : in    std_logic                     := 'X';             -- SPI_SDI
			cyclonespi_spi_interface_SPI_SDO            : out   std_logic;                                        -- SPI_SDO
			cyclonespi_spi_interface_data_out           : out   std_logic_vector(7 downto 0);                     -- data_out
			cyclonespi_spi_interface_data_out_enable    : out   std_logic;                                        -- data_out_enable
			cyclonespi_spi_interface_config             : out   std_logic_vector(7 downto 0);                     -- config
			cyclonespi_spi_interface_spi_irq            : out   std_logic;                                        -- spi_irq
			from_key_export                             : in    std_logic                     := 'X';             -- export
			gsensor_int_external_connection_export      : in    std_logic                     := 'X';             -- export
			gsensor_spi_conduit_end_SDIO                : inout std_logic                     := 'X';             -- SDIO
			gsensor_spi_conduit_end_SCLK                : out   std_logic;                                        -- SCLK
			gsensor_spi_conduit_end_CS_n                : out   std_logic;                                        -- CS_n
			lt24_buffer_flag_external_connection_export : out   std_logic;                                        -- export
			lt24_conduit_cs                             : out   std_logic;                                        -- cs
			lt24_conduit_rs                             : out   std_logic;                                        -- rs
			lt24_conduit_rd                             : out   std_logic;                                        -- rd
			lt24_conduit_wr                             : out   std_logic;                                        -- wr
			lt24_conduit_data                           : out   std_logic_vector(15 downto 0);                    -- data
			lt24_conduit_1_finish_flag                  : in    std_logic                     := 'X';             -- finish_flag
			lt24_conduit_1_counter                      : in    std_logic_vector(31 downto 0) := (others => 'X'); -- counter
			lt24_conduit_1_pattern                      : out   std_logic_vector(11 downto 0);                    -- pattern
			lt24_conduit_1_vx                           : out   std_logic_vector(31 downto 0);                    -- vx
			lt24_conduit_1_vy                           : out   std_logic_vector(31 downto 0);                    -- vy
			lt24_conduit_1_lt24_coin_x0                 : out   std_logic_vector(31 downto 0);                    -- lt24_coin_x0
			lt24_conduit_1_lt42_coin_y0                 : out   std_logic_vector(31 downto 0);                    -- lt42_coin_y0
			lt24_conduit_1_lt24_coinx                   : in    std_logic_vector(31 downto 0) := (others => 'X'); -- lt24_coinx
			lt24_conduit_1_lt24_coin_y                  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- lt24_coin_y
			lt24_conduit_1_lt24_coin_vx0                : out   std_logic_vector(31 downto 0);                    -- lt24_coin_vx0
			lt24_conduit_1_lt24_coin_vy0                : out   std_logic_vector(31 downto 0);                    -- lt24_coin_vy0
			lt24_conduit_1_lt24_pattern_0               : out   std_logic_vector(11 downto 0);                    -- lt24_pattern_0
			lt24_lcd_rstn_export                        : out   std_logic;                                        -- export
			lt24_touch_busy_export                      : in    std_logic                     := 'X';             -- export
			lt24_touch_penirq_n_export                  : in    std_logic                     := 'X';             -- export
			lt24_touch_spi_MISO                         : in    std_logic                     := 'X';             -- MISO
			lt24_touch_spi_MOSI                         : out   std_logic;                                        -- MOSI
			lt24_touch_spi_SCLK                         : out   std_logic;                                        -- SCLK
			lt24_touch_spi_SS_n                         : out   std_logic;                                        -- SS_n
			pic_mem_s2_address                          : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			pic_mem_s2_chipselect                       : in    std_logic                     := 'X';             -- chipselect
			pic_mem_s2_clken                            : in    std_logic                     := 'X';             -- clken
			pic_mem_s2_write                            : in    std_logic                     := 'X';             -- write
			pic_mem_s2_readdata                         : out   std_logic_vector(15 downto 0);                    -- readdata
			pic_mem_s2_writedata                        : in    std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			pic_mem_s2_byteenable                       : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- byteenable
			reset_reset_n                               : in    std_logic                     := 'X';             -- reset_n
			sdram_controler_wire_addr                   : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_controler_wire_ba                     : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_controler_wire_cas_n                  : out   std_logic;                                        -- cas_n
			sdram_controler_wire_cke                    : out   std_logic;                                        -- cke
			sdram_controler_wire_cs_n                   : out   std_logic;                                        -- cs_n
			sdram_controler_wire_dq                     : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_controler_wire_dqm                    : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_controler_wire_ras_n                  : out   std_logic;                                        -- ras_n
			sdram_controler_wire_we_n                   : out   std_logic;                                        -- we_n
			snake_mem_address                           : in    std_logic_vector(9 downto 0)  := (others => 'X'); -- address
			snake_mem_chipselect                        : in    std_logic                     := 'X';             -- chipselect
			snake_mem_clken                             : in    std_logic                     := 'X';             -- clken
			snake_mem_write                             : in    std_logic                     := 'X';             -- write
			snake_mem_readdata                          : out   std_logic_vector(7 downto 0);                     -- readdata
			snake_mem_writedata                         : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- writedata
			to_led_export                               : out   std_logic_vector(7 downto 0)                      -- export
		);
	end component DE0_LT24_SOPC;

	u0 : component DE0_LT24_SOPC
		port map (
			alt_pll_areset_conduit_export               => CONNECTED_TO_alt_pll_areset_conduit_export,               --               alt_pll_areset_conduit.export
			alt_pll_c1_clk                              => CONNECTED_TO_alt_pll_c1_clk,                              --                           alt_pll_c1.clk
			alt_pll_c3_clk                              => CONNECTED_TO_alt_pll_c3_clk,                              --                           alt_pll_c3.clk
			alt_pll_locked_conduit_export               => CONNECTED_TO_alt_pll_locked_conduit_export,               --               alt_pll_locked_conduit.export
			alt_pll_phasedone_conduit_export            => CONNECTED_TO_alt_pll_phasedone_conduit_export,            --            alt_pll_phasedone_conduit.export
			background_mem_s2_address                   => CONNECTED_TO_background_mem_s2_address,                   --                    background_mem_s2.address
			background_mem_s2_chipselect                => CONNECTED_TO_background_mem_s2_chipselect,                --                                     .chipselect
			background_mem_s2_clken                     => CONNECTED_TO_background_mem_s2_clken,                     --                                     .clken
			background_mem_s2_write                     => CONNECTED_TO_background_mem_s2_write,                     --                                     .write
			background_mem_s2_readdata                  => CONNECTED_TO_background_mem_s2_readdata,                  --                                     .readdata
			background_mem_s2_writedata                 => CONNECTED_TO_background_mem_s2_writedata,                 --                                     .writedata
			background_mem_s2_byteenable                => CONNECTED_TO_background_mem_s2_byteenable,                --                                     .byteenable
			clk_clk                                     => CONNECTED_TO_clk_clk,                                     --                                  clk.clk
			cyclonespi_spi_interface_SPI_clk            => CONNECTED_TO_cyclonespi_spi_interface_SPI_clk,            --             cyclonespi_spi_interface.SPI_clk
			cyclonespi_spi_interface_SPI_CS             => CONNECTED_TO_cyclonespi_spi_interface_SPI_CS,             --                                     .SPI_CS
			cyclonespi_spi_interface_SPI_SDI            => CONNECTED_TO_cyclonespi_spi_interface_SPI_SDI,            --                                     .SPI_SDI
			cyclonespi_spi_interface_SPI_SDO            => CONNECTED_TO_cyclonespi_spi_interface_SPI_SDO,            --                                     .SPI_SDO
			cyclonespi_spi_interface_data_out           => CONNECTED_TO_cyclonespi_spi_interface_data_out,           --                                     .data_out
			cyclonespi_spi_interface_data_out_enable    => CONNECTED_TO_cyclonespi_spi_interface_data_out_enable,    --                                     .data_out_enable
			cyclonespi_spi_interface_config             => CONNECTED_TO_cyclonespi_spi_interface_config,             --                                     .config
			cyclonespi_spi_interface_spi_irq            => CONNECTED_TO_cyclonespi_spi_interface_spi_irq,            --                                     .spi_irq
			from_key_export                             => CONNECTED_TO_from_key_export,                             --                             from_key.export
			gsensor_int_external_connection_export      => CONNECTED_TO_gsensor_int_external_connection_export,      --      gsensor_int_external_connection.export
			gsensor_spi_conduit_end_SDIO                => CONNECTED_TO_gsensor_spi_conduit_end_SDIO,                --              gsensor_spi_conduit_end.SDIO
			gsensor_spi_conduit_end_SCLK                => CONNECTED_TO_gsensor_spi_conduit_end_SCLK,                --                                     .SCLK
			gsensor_spi_conduit_end_CS_n                => CONNECTED_TO_gsensor_spi_conduit_end_CS_n,                --                                     .CS_n
			lt24_buffer_flag_external_connection_export => CONNECTED_TO_lt24_buffer_flag_external_connection_export, -- lt24_buffer_flag_external_connection.export
			lt24_conduit_cs                             => CONNECTED_TO_lt24_conduit_cs,                             --                         lt24_conduit.cs
			lt24_conduit_rs                             => CONNECTED_TO_lt24_conduit_rs,                             --                                     .rs
			lt24_conduit_rd                             => CONNECTED_TO_lt24_conduit_rd,                             --                                     .rd
			lt24_conduit_wr                             => CONNECTED_TO_lt24_conduit_wr,                             --                                     .wr
			lt24_conduit_data                           => CONNECTED_TO_lt24_conduit_data,                           --                                     .data
			lt24_conduit_1_finish_flag                  => CONNECTED_TO_lt24_conduit_1_finish_flag,                  --                       lt24_conduit_1.finish_flag
			lt24_conduit_1_counter                      => CONNECTED_TO_lt24_conduit_1_counter,                      --                                     .counter
			lt24_conduit_1_pattern                      => CONNECTED_TO_lt24_conduit_1_pattern,                      --                                     .pattern
			lt24_conduit_1_vx                           => CONNECTED_TO_lt24_conduit_1_vx,                           --                                     .vx
			lt24_conduit_1_vy                           => CONNECTED_TO_lt24_conduit_1_vy,                           --                                     .vy
			lt24_conduit_1_lt24_coin_x0                 => CONNECTED_TO_lt24_conduit_1_lt24_coin_x0,                 --                                     .lt24_coin_x0
			lt24_conduit_1_lt42_coin_y0                 => CONNECTED_TO_lt24_conduit_1_lt42_coin_y0,                 --                                     .lt42_coin_y0
			lt24_conduit_1_lt24_coinx                   => CONNECTED_TO_lt24_conduit_1_lt24_coinx,                   --                                     .lt24_coinx
			lt24_conduit_1_lt24_coin_y                  => CONNECTED_TO_lt24_conduit_1_lt24_coin_y,                  --                                     .lt24_coin_y
			lt24_conduit_1_lt24_coin_vx0                => CONNECTED_TO_lt24_conduit_1_lt24_coin_vx0,                --                                     .lt24_coin_vx0
			lt24_conduit_1_lt24_coin_vy0                => CONNECTED_TO_lt24_conduit_1_lt24_coin_vy0,                --                                     .lt24_coin_vy0
			lt24_conduit_1_lt24_pattern_0               => CONNECTED_TO_lt24_conduit_1_lt24_pattern_0,               --                                     .lt24_pattern_0
			lt24_lcd_rstn_export                        => CONNECTED_TO_lt24_lcd_rstn_export,                        --                        lt24_lcd_rstn.export
			lt24_touch_busy_export                      => CONNECTED_TO_lt24_touch_busy_export,                      --                      lt24_touch_busy.export
			lt24_touch_penirq_n_export                  => CONNECTED_TO_lt24_touch_penirq_n_export,                  --                  lt24_touch_penirq_n.export
			lt24_touch_spi_MISO                         => CONNECTED_TO_lt24_touch_spi_MISO,                         --                       lt24_touch_spi.MISO
			lt24_touch_spi_MOSI                         => CONNECTED_TO_lt24_touch_spi_MOSI,                         --                                     .MOSI
			lt24_touch_spi_SCLK                         => CONNECTED_TO_lt24_touch_spi_SCLK,                         --                                     .SCLK
			lt24_touch_spi_SS_n                         => CONNECTED_TO_lt24_touch_spi_SS_n,                         --                                     .SS_n
			pic_mem_s2_address                          => CONNECTED_TO_pic_mem_s2_address,                          --                           pic_mem_s2.address
			pic_mem_s2_chipselect                       => CONNECTED_TO_pic_mem_s2_chipselect,                       --                                     .chipselect
			pic_mem_s2_clken                            => CONNECTED_TO_pic_mem_s2_clken,                            --                                     .clken
			pic_mem_s2_write                            => CONNECTED_TO_pic_mem_s2_write,                            --                                     .write
			pic_mem_s2_readdata                         => CONNECTED_TO_pic_mem_s2_readdata,                         --                                     .readdata
			pic_mem_s2_writedata                        => CONNECTED_TO_pic_mem_s2_writedata,                        --                                     .writedata
			pic_mem_s2_byteenable                       => CONNECTED_TO_pic_mem_s2_byteenable,                       --                                     .byteenable
			reset_reset_n                               => CONNECTED_TO_reset_reset_n,                               --                                reset.reset_n
			sdram_controler_wire_addr                   => CONNECTED_TO_sdram_controler_wire_addr,                   --                 sdram_controler_wire.addr
			sdram_controler_wire_ba                     => CONNECTED_TO_sdram_controler_wire_ba,                     --                                     .ba
			sdram_controler_wire_cas_n                  => CONNECTED_TO_sdram_controler_wire_cas_n,                  --                                     .cas_n
			sdram_controler_wire_cke                    => CONNECTED_TO_sdram_controler_wire_cke,                    --                                     .cke
			sdram_controler_wire_cs_n                   => CONNECTED_TO_sdram_controler_wire_cs_n,                   --                                     .cs_n
			sdram_controler_wire_dq                     => CONNECTED_TO_sdram_controler_wire_dq,                     --                                     .dq
			sdram_controler_wire_dqm                    => CONNECTED_TO_sdram_controler_wire_dqm,                    --                                     .dqm
			sdram_controler_wire_ras_n                  => CONNECTED_TO_sdram_controler_wire_ras_n,                  --                                     .ras_n
			sdram_controler_wire_we_n                   => CONNECTED_TO_sdram_controler_wire_we_n,                   --                                     .we_n
			snake_mem_address                           => CONNECTED_TO_snake_mem_address,                           --                            snake_mem.address
			snake_mem_chipselect                        => CONNECTED_TO_snake_mem_chipselect,                        --                                     .chipselect
			snake_mem_clken                             => CONNECTED_TO_snake_mem_clken,                             --                                     .clken
			snake_mem_write                             => CONNECTED_TO_snake_mem_write,                             --                                     .write
			snake_mem_readdata                          => CONNECTED_TO_snake_mem_readdata,                          --                                     .readdata
			snake_mem_writedata                         => CONNECTED_TO_snake_mem_writedata,                         --                                     .writedata
			to_led_export                               => CONNECTED_TO_to_led_export                                --                               to_led.export
		);

