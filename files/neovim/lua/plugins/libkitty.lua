return {
	dir = "~/personal/libkitty.nvim",
	dependencies = {},
	config = function()
		local tmux = require("libkitty")
		vim.keymap.set("n", "<leader><leader>a", function()
			tmux:rename_session({ name = "wwa" })
		end)

		vim.keymap.set("n", "<leader><leader>a", function()
			tmux:send_keys({ window_name = "bash", keys = {"ls -la", "Enter"}, and_select = true })
		end)

		vim.keymap.set("n", "<leader><leader>r", function()
			tmux:new_window({ name = "ww" })
		end)

		vim.keymap.set("n", "<leader><leader>w", function()
			P(vim.inspect(tmux:get_session("ww")))
		end)
	end,
}
