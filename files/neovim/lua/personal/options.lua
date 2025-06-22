local opt = vim.o

opt.relativenumber = true
opt.number = true

opt.laststatus = 3 -- have a global statusline at the bottom instead of one for each window.


-- Command-line Window for the win
opt.cmdwinheight = 3

local cmdwingroups= vim.api.nvim_create_augroup("aucmdwin", {clear = false})

vim.api.nvim_create_autocmd({'CmdwinEnter'}, {
	group = cmdwingroup, 
	pattern = "*", 
	command = "startinsert"
})

