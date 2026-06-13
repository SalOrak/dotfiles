return {
	-- "salorak/godot.nvim",
	dir = "~/personal/godot.nvim",
	dependencies = {},
	config = function()
		local godot = require'godot'
		godot.setup({
			picker = "fzf_lua",
		})

		vim.keymap.set({"n"}, "<leader>g", function()
			godot.run()
		end)
	end,
}
