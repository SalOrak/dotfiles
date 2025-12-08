local augroup_name = "salorak"

-- Autogroup
local autogroup = vim.api.nvim_create_augroup(augroup_name, { clear = true })

-- Customizing quickfix

-- Rust compiler
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = autogroup,
	pattern = {"*.rs", "Cargo.toml"},
	callback = function()
        vim.cmd(string.format("compiler %s", "cargo") )

        vim.keymap.set({"n", "v"}, "<leader>wa", ":make clippy<CR>", {
            desc = "Clippy",
            buffer = true
        })
	end,
})

-- Zig compiler
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = autogroup,
	pattern = {"*.zig"},
	callback = function()
        vim.cmd(string.format("compiler %s", "zig_build") )
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
