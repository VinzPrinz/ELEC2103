	component MTL_SOPC is
		port (
			clk_clk                            : in  std_logic                     := 'X';             -- clk
			from_key_export                    : in  std_logic                     := 'X';             -- export
			maptransfer_map_map_line0          : out std_logic_vector(15 downto 0);                    -- map_line0
			maptransfer_map_map_line1          : out std_logic_vector(15 downto 0);                    -- map_line1
			maptransfer_map_map_line2          : out std_logic_vector(15 downto 0);                    -- map_line2
			maptransfer_map_map_line3          : out std_logic_vector(15 downto 0);                    -- map_line3
			maptransfer_map_map_line4          : out std_logic_vector(15 downto 0);                    -- map_line4
			maptransfer_map_map_line5          : out std_logic_vector(15 downto 0);                    -- map_line5
			maptransfer_map_map_line6          : out std_logic_vector(15 downto 0);                    -- map_line6
			maptransfer_map_map_line7          : out std_logic_vector(15 downto 0);                    -- map_line7
			reset_reset_n                      : in  std_logic                     := 'X';             -- reset_n
			testled_external_connection_export : out std_logic_vector(3 downto 0);                     -- export
			touchdata_ext_export               : in  std_logic_vector(19 downto 0) := (others => 'X')  -- export
		);
	end component MTL_SOPC;

	u0 : component MTL_SOPC
		port map (
			clk_clk                            => CONNECTED_TO_clk_clk,                            --                         clk.clk
			from_key_export                    => CONNECTED_TO_from_key_export,                    --                    from_key.export
			maptransfer_map_map_line0          => CONNECTED_TO_maptransfer_map_map_line0,          --             maptransfer_map.map_line0
			maptransfer_map_map_line1          => CONNECTED_TO_maptransfer_map_map_line1,          --                            .map_line1
			maptransfer_map_map_line2          => CONNECTED_TO_maptransfer_map_map_line2,          --                            .map_line2
			maptransfer_map_map_line3          => CONNECTED_TO_maptransfer_map_map_line3,          --                            .map_line3
			maptransfer_map_map_line4          => CONNECTED_TO_maptransfer_map_map_line4,          --                            .map_line4
			maptransfer_map_map_line5          => CONNECTED_TO_maptransfer_map_map_line5,          --                            .map_line5
			maptransfer_map_map_line6          => CONNECTED_TO_maptransfer_map_map_line6,          --                            .map_line6
			maptransfer_map_map_line7          => CONNECTED_TO_maptransfer_map_map_line7,          --                            .map_line7
			reset_reset_n                      => CONNECTED_TO_reset_reset_n,                      --                       reset.reset_n
			testled_external_connection_export => CONNECTED_TO_testled_external_connection_export, -- testled_external_connection.export
			touchdata_ext_export               => CONNECTED_TO_touchdata_ext_export                --               touchdata_ext.export
		);

