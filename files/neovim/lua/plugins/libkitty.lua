return {
	dir = "/home/hector/personal/libkitty.nvim",
	dependencies = {},
	dev = true,
	config = function()
		local kitty = require("libkitty")
		vim.keymap.set("n", "<leader><leader>k", function()
			vim.print(kitty.tab_exists("nvim"):wait())
		end)
	end,
}
