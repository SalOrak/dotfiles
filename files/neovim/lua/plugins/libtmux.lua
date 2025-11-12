return {
	dir = "/home/hector/personal/libtmux.nvim",
	dependencies = {},
	dev = true,
	config = function()
		local tmux = require("libtmux")
		vim.keymap.set("n", "<leader><leader>a", function()
			tmux:new_session({ name = "ww" })
		end)

		vim.keymap.set("n", "<leader><leader>w", function()
			P(vim.inspect(tmux:get_session("ww")))
		end)

		vim.keymap.set("n", "<leader><leader>b", function()
			local window_name = "bash"

			tmux:send_keys({
				window_name = window_name,
				keys = { "C-l", "ls -la", "Enter" },
			})

			tmux:select_window(window_name)

			vim.loop.new_timer():start(3000, 0, function()
				vim.schedule(function()
					tmux:select_window("nvim")
				end)
			end)
		end)
	end,
}
