require('salorak.setup.keymaps')
require('salorak.setup.auto')

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0 -- Remove banner
vim.g.netrw_liststyle = 1 -- List style

local opt = vim.opt 

-- Numbers on the left + relative number
opt.nu = true
opt.relativenumber = true

-- Identation fix
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent= true


-- Search highlight progressively (incremental search)
opt.hlsearch = false
opt.incsearch = true

-- Termguicolors 
opt.termguicolors = true

-- Keeps at least 8 rows below or above at any time, except on EOF
opt.scrolloff = 8

-- Turn off statusline
opt.laststatus= 0

-- Update time 
opt.updatetime = 50

-- Show typed command in status bar
opt.showcmd = true

-- Show file title in status bar
opt.title= true

-- Status line
--opt.statusline = "%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

-- Window vertical split by default


