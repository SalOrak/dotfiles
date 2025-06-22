return {
	'stevearc/oil.nvim',
	opts = {},
	dependencies = { "echasnovski/mini.icons", opts = {}},
	lazy = false,
	config = function()
		oil_keymaps = {
		}
		require("oil").setup({
			default_file_explorer = true,
			skip_confirm_for_simple_edits = true,	
			watch_for_changes = true,
			view_options = {
				show_hidden = true,
			},
		})
	end,
}
