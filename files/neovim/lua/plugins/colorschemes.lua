return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			local kana = require("kanagawa")
			kana.setup({
				dimInactive = false,
				transparent = false,
			})

			vim.cmd("colorscheme kanagawa")
		end,
	},
	{}
}
