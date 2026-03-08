return {
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		config = function()
			local kana = require("kanagawa")
			kana.setup({
				dimInactive = false,
				transparent = false,
			})

			vim.cmd("colorscheme kanagawa")
		end,
	},
	{
	"catppuccin/nvim",
	priority = 1000,
	config = function()
		local cat = require'catppuccin'
		vim.cmd("colorscheme catppuccin-mocha")
	end
	}

}
