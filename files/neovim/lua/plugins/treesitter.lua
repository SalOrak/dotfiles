return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		local treesitter = require('nvim-treesitter')
		treesitter.setup {
			ensure_installed = {"c", "lua", "vim","vimdoc","markdown","query"},
			sync_install = false,
			auto_install = false,
			highlight = {
				enable = true
			} 
		}
	end,
}
