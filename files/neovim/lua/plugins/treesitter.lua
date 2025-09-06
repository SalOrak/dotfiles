return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		local treesitter = require('nvim-treesitter')
		treesitter.setup {
			ensure_installed = {"c", "bash", "lua", "zig", "rust", "python", "vim","vimdoc","markdown","query", "ansible"},
			sync_install = true,
			auto_install = true,
			highlight = {
				enable = true
			} 
		}
	end,
}
