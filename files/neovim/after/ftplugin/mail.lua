local is_aerc = os.getenv("AERC_ACCOUNT") ~= nil

local k = vim.keymap

local aerc_keymap = function(lhs, rhs, opts, command)
	local command = "!aerc " .. command
	local cmd = vim.api.nvim_parse_cmd(command, {})
	cmd.mods.silent = true

	k.set(lhs, rhs, function()
		vim.api.nvim_cmd(cmd, { output = false })
	end, opts)
end

if is_aerc then
	aerc_keymap("n", "<leader>p", { desc = "Previous field" }, ":prev-field")
	aerc_keymap("n", "<leader>n", { desc = "Next field" }, ":next-field")

	aerc_keymap("n", "<Tab>", { desc = "Next Field" }, ":next-field")
	aerc_keymap("n", "<S-Tab>", { desc = "Previous Field" }, ":prev-field")

	aerc_keymap("n", "<leader>a", { desc = "Abort" }, ":abort")

	--  https://www.souji-thenria.net/posts/neovim_format_flowed/
	--  a = Automatic formatting of paragraphs
	--  w = Trailing white space indicates a paragraph continues in the next line.
	--  q = Allow formatting of comments with “gq”
	vim.opt.formatoptions = "awq"
end
