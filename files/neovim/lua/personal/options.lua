local opt = vim.o

opt.number = true
opt.relativenumber = true

opt.laststatus = 3 -- have a global statusline at the bottom instead of one for each window.

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.smartindent = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth= 4
opt.expandtab = true

opt.wrap = false

opt.scrolloff = 8
opt.signcolumn = "yes"

opt.updatetime = 50

-- Command-line Window for the win
opt.cmdwinheight = 3

local cmdwingroups= vim.api.nvim_create_augroup("aucmdwin", {clear = false})

vim.api.nvim_create_autocmd({'CmdwinEnter'}, {
	group = cmdwingroup, 
	pattern = "*", 
	command = "startinsert"
})

