local augroup_name = "salorak"

-- Autogroup
local autogroup = vim.api.nvim_create_augroup(augroup_name, { clear = true })

-- Customizing quickfix
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = autogroup,
	pattern = "qf",
	callback = function()
		-- Window is always at bottom
		vim.cmd("wincmd J")
	end,
})

-- Customizing man pages
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = autogroup,
	pattern = { "man", "help" },
	callback = function(ev)
		print("[Autocmd] For help/ manual pages")
		-- Window is always left
		vim.cmd("wincmd H")
	end,
})

-- Terminal mode always in insert mode.
vim.api.nvim_create_autocmd({ "TermOpen" }, {
	group = autogroup,
	pattern = "*",
	command = ":norm i",
})

-- Highlight after yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = autogroup,
	callback = function()
		vim.hl.on_yank()
	end,
})
