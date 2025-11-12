return {
	"dhruvasagar/vim-table-mode",
	config = function()
		local g = vim.g

		g.table_mode_disable_mappings = 1
		g.table_mode_disable_tableize_mappings = 1
		g.table_mode_verbose = 0
		g.table_mode_separator = "|"
		g.table_mode_auto_align = 1
	end,
}
