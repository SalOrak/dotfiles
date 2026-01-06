return {
	"rebelot/kanagawa.nvim",
	config = function()
		local kana = require("kanagawa")
		kana.setup({
			dimInactive = true,
            transparent = true,
		})

		vim.cmd("colorscheme kanagawa-dragon")
	end,
}
