local augroup_name = "salorak"

-- Autogroup
local autogroup = vim.api.nvim_create_augroup(augroup_name, { clear = true })

-- Customizing quickfix
vim.api.nvim_create_autocmd({ "FileType"}, {
    group = autogroup,
    pattern = "qf",
    callback = function()
        -- Bottom
        vim.cmd("wincmd J")
    end
})

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

-- -- Terminal mode always in insert mode.
-- vim.api.nvim_create_autocmd({ "TermOpen" }, {
-- 	group = autogroup,
-- 	pattern = "*",
-- 	command = ":norm i",
-- })

-- Highlight after yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = autogroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Change formatoptions to be "global" and override any local setup
-- Issue https://github.com/neovim/neovim/discussions/26885
vim.api.nvim_create_autocmd("FileType", {
	desc = "Highlight when yanking text",
	group = autogroup,
    pattern = "*",
	callback = function()
        -- Influence Vim formats text
        -- c : Autowrap comments using textwidth, inserting current comment leader automatically
        -- r : Automatically insert the current comment leader after <Enter>
        -- q : Allow formatting of comments with 'gq'
        -- j : remove a comment leader when joining comment lines
        vim.opt.formatoptions = "cjqr"
	end,
})

