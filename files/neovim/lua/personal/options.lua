local opt = vim.opt

opt.number = true
opt.relativenumber = true

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

opt.updatetime = 50

-- Command-line Window for the win
opt.cmdwinheight = 3

local cmdwingroups= vim.api.nvim_create_augroup("aucmdwin", {clear = false})

vim.api.nvim_create_autocmd({'CmdwinEnter'}, {
	group = cmdwingroup, 
	pattern = "*", 
	command = "startinsert"
})

