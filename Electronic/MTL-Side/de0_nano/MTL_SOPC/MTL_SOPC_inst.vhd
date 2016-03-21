	component MTL_SOPC is
		port (
			clk_clk                                       : in  std_logic                     := 'X';             -- clk
			from_key_export                               : in  std_logic                     := 'X';             -- export
			maptransfer_map_map_line0                     : out std_logic_vector(31 downto 0);                    -- map_line0
			maptransfer_map_map_line1                     : out std_logic_vector(31 downto 0);                    -- map_line1
			maptransfer_map_map_line2                     : out std_logic_vector(31 downto 0);                    -- map_line2
			maptransfer_map_map_line3                     : out std_logic_vector(31 downto 0);                    -- map_line3
			maptransfer_map_map_line4                     : out std_logic_vector(31 downto 0);                    -- map_line4
			maptransfer_map_map_line5                     : out std_logic_vector(31 downto 0);                    -- map_line5
			maptransfer_map_map_line6                     : out std_logic_vector(31 downto 0);                    -- map_line6
			maptransfer_map_map_line7                     : out std_logic_vector(31 downto 0);                    -- map_line7
			mtl_interface_irq_0_mtl_intreface_mtl_counter : in  std_logic_vector(31 downto 0) := (others => 'X'); -- mtl_counter
			mtl_interface_irq_0_mtl_intreface_mtl_irq     : in  std_logic                     := 'X';             -- mtl_irq
			mtl_interface_irq_0_mtl_intreface_mtl_reset   : out std_logic;                                        -- mtl_reset
			mtl_interface_irq_0_mtl_intreface_mtl_mode    : out std_logic_vector(3 downto 0);                     -- mtl_mode
			reset_reset_n                                 : in  std_logic                     := 'X';             -- reset_n
			testled_external_connection_export            : out std_logic_vector(3 downto 0);                     -- export
			touchdata_ext_export                          : in  std_logic_vector(19 downto 0) := (others => 'X'); -- export
			turn_ext_export                               : out std_logic;                                        -- export
			cyclonespi_0_spi_interface_Config             : out std_logic_vector(7 downto 0);                     -- Config
			cyclonespi_0_spi_interface_SPI_CS             : in  std_logic                     := 'X';             -- SPI_CS
			cyclonespi_0_spi_interface_SPI_SDI            : in  std_logic                     := 'X';             -- SPI_SDI
			cyclonespi_0_spi_interface_SPI_SDO            : out std_logic;                                        -- SPI_SDO
			cyclonespi_0_spi_interface_SPI_clk            : in  std_logic                     := 'X';             -- SPI_clk
			cyclonespi_0_spi_interface_data_out           : out std_logic_vector(7 downto 0);                     -- data_out
			cyclonespi_0_spi_interface_data_out_enable    : out std_logic;                                        -- data_out_enable
			cyclonespi_0_spi_interface_spi_irq            : out std_logic                                         -- spi_irq
		);
	end component MTL_SOPC;

	u0 : component MTL_SOPC
		port map (
			clk_clk                                       => CONNECTED_TO_clk_clk,                                       --                               clk.clk
			from_key_export                               => CONNECTED_TO_from_key_export,                               --                          from_key.export
			maptransfer_map_map_line0                     => CONNECTED_TO_maptransfer_map_map_line0,                     --                   maptransfer_map.map_line0
			maptransfer_map_map_line1                     => CONNECTED_TO_maptransfer_map_map_line1,                     --                                  .map_line1
			maptransfer_map_map_line2                     => CONNECTED_TO_maptransfer_map_map_line2,                     --                                  .map_line2
			maptransfer_map_map_line3                     => CONNECTED_TO_maptransfer_map_map_line3,                     --                                  .map_line3
			maptransfer_map_map_line4                     => CONNECTED_TO_maptransfer_map_map_line4,                     --                                  .map_line4
			maptransfer_map_map_line5                     => CONNECTED_TO_maptransfer_map_map_line5,                     --                                  .map_line5
			maptransfer_map_map_line6                     => CONNECTED_TO_maptransfer_map_map_line6,                     --                                  .map_line6
			maptransfer_map_map_line7                     => CONNECTED_TO_maptransfer_map_map_line7,                     --                                  .map_line7
			mtl_interface_irq_0_mtl_intreface_mtl_counter => CONNECTED_TO_mtl_interface_irq_0_mtl_intreface_mtl_counter, -- mtl_interface_irq_0_mtl_intreface.mtl_counter
			mtl_interface_irq_0_mtl_intreface_mtl_irq     => CONNECTED_TO_mtl_interface_irq_0_mtl_intreface_mtl_irq,     --                                  .mtl_irq
			mtl_interface_irq_0_mtl_intreface_mtl_reset   => CONNECTED_TO_mtl_interface_irq_0_mtl_intreface_mtl_reset,   --                                  .mtl_reset
			mtl_interface_irq_0_mtl_intreface_mtl_mode    => CONNECTED_TO_mtl_interface_irq_0_mtl_intreface_mtl_mode,    --                                  .mtl_mode
			reset_reset_n                                 => CONNECTED_TO_reset_reset_n,                                 --                             reset.reset_n
			testled_external_connection_export            => CONNECTED_TO_testled_external_connection_export,            --       testled_external_connection.export
			touchdata_ext_export                          => CONNECTED_TO_touchdata_ext_export,                          --                     touchdata_ext.export
			turn_ext_export                               => CONNECTED_TO_turn_ext_export,                               --                          turn_ext.export
			cyclonespi_0_spi_interface_Config             => CONNECTED_TO_cyclonespi_0_spi_interface_Config,             --        cyclonespi_0_spi_interface.Config
			cyclonespi_0_spi_interface_SPI_CS             => CONNECTED_TO_cyclonespi_0_spi_interface_SPI_CS,             --                                  .SPI_CS
			cyclonespi_0_spi_interface_SPI_SDI            => CONNECTED_TO_cyclonespi_0_spi_interface_SPI_SDI,            --                                  .SPI_SDI
			cyclonespi_0_spi_interface_SPI_SDO            => CONNECTED_TO_cyclonespi_0_spi_interface_SPI_SDO,            --                                  .SPI_SDO
			cyclonespi_0_spi_interface_SPI_clk            => CONNECTED_TO_cyclonespi_0_spi_interface_SPI_clk,            --                                  .SPI_clk
			cyclonespi_0_spi_interface_data_out           => CONNECTED_TO_cyclonespi_0_spi_interface_data_out,           --                                  .data_out
			cyclonespi_0_spi_interface_data_out_enable    => CONNECTED_TO_cyclonespi_0_spi_interface_data_out_enable,    --                                  .data_out_enable
			cyclonespi_0_spi_interface_spi_irq            => CONNECTED_TO_cyclonespi_0_spi_interface_spi_irq             --                                  .spi_irq
		);

