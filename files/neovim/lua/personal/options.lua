local opt = vim.opt

opt.number = true
opt.relativenumber = true

-- Case-insensitive searching
vim.o.ignorecase = true
vim.o.smartcase = true

opt.laststatus = 3 -- have a global statusline at the bottom instead of one for each window.

-- Don't have 'o' add a comment
opt.formatoptions:remove("o")


opt.inccommand = "split" 

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.smartindent = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth= 4
opt.expandtab = true

opt.wrap = true

opt.scrolloff = 8
opt.signcolumn = "yes"

opt.updatetime = 250

--- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Show which line your cursor is on
vim.o.cursorline = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'` 
vim.o.confirm = true


-- Command-line Window for the win
opt.cmdwinheight = 3

local cmdwingroups= vim.api.nvim_create_augroup("aucmdwin", {clear = false})

vim.api.nvim_create_autocmd({'CmdwinEnter'}, {
	group = cmdwingroup, 
	pattern = "*", 
	command = "startinsert"
})

