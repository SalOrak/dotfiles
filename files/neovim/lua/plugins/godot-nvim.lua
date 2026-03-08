return {
	dir = "/home/hector/personal/godot.nvim",
	lazy = false,
	config = function()
		local godot = require("godot")
		godot.setup({})

		vim.keymap.set({"n", "v"}, "<leader>x", godot.run )
	end,
}
