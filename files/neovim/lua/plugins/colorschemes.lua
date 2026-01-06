return {
	"rebelot/kanagawa.nvim",
	config = function()
		local kana = require("kanagawa")
		kana.setup({
			dimInactive = true,
            transparent = false,
		})

		vim.cmd("colorscheme kanagawa-dragon")
	end,
}
