
-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", {}),
	callback = function()
		local set = vim.opt_local

		set.number = false
		set.relativenumber = false
		set.scrolloff = 0

		-- vim.bo.filetype = "terminal"
	end,
})


--- TODO: Maybe put this as a yet another easy to use plugin?
--- probably I will put it in orak.nvim plugin box.
--- I like implementing bits of neovim myself.

--- Terminal Fullscreen
local M = {
	edit_buf = nil,
	term_buf = nil,
	term_chan = -1,
	toggle_keymap = "",
}

M.toggle_term = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local is_terminal = vim.bo.buftype== "terminal"

	if is_terminal then
		if M.edit_buf and vim.api.nvim_buf_is_valid(M.edit_buf) then
			vim.api.nvim_set_current_buf(M.edit_buf)
		else
			vim.cmd.new()
			vim.cmd.wincmd("o")
			M.edit_buf = vim.api.nvim_get_current_buf()
			vim.api.nvim_set_current_buf(M.edit_buf)
		end
		return
	end

	if M.term_buf and vim.api.nvim_buf_is_valid(M.term_buf) then
		M.edit_buf = bufnr
		vim.api.nvim_set_current_buf(M.term_buf)
	else 
		M.edit_buf = bufnr
		vim.cmd.new()
		vim.cmd("terminal")
		vim.cmd.wincmd("o")
		M.term_buf = vim.api.nvim_get_current_buf()
	end
end

vim.keymap.set({"n", "t", "i"}, "<c-f>", M.toggle_term)

