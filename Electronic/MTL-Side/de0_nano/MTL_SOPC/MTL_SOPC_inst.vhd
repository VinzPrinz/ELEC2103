	component MTL_SOPC is
		port (
			clk_clk                            : in  std_logic                     := 'X';             -- clk
			from_key_export                    : in  std_logic                     := 'X';             -- export
			reset_reset_n                      : in  std_logic                     := 'X';             -- reset_n
			testled_external_connection_export : out std_logic_vector(3 downto 0);                     -- export
			touchdata_ext_export               : in  std_logic_vector(19 downto 0) := (others => 'X')  -- export
		);
	end component MTL_SOPC;

	u0 : component MTL_SOPC
		port map (
			clk_clk                            => CONNECTED_TO_clk_clk,                            --                         clk.clk
			from_key_export                    => CONNECTED_TO_from_key_export,                    --                    from_key.export
			reset_reset_n                      => CONNECTED_TO_reset_reset_n,                      --                       reset.reset_n
			testled_external_connection_export => CONNECTED_TO_testled_external_connection_export, -- testled_external_connection.export
			touchdata_ext_export               => CONNECTED_TO_touchdata_ext_export                --               touchdata_ext.export
		);

