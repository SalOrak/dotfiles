-- Set <Leader> to Space (SPC)
vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set("n", "J", "mzJ`z")

-- Keep centered while scrolling
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep centered while going through searches
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "nzzzv")

-- Copy function using shortcut
keymap.set("n", "yaf", "va{Vy}")
keymap.set("n", "yif", "vi{Vy}")

-- Remap jk to Esc (enter normal mode without pressing Esc)
-- keymap.set("i", "jk", "<Esc>")

-- Set working directory to current directory
keymap.set("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>")



-------------------------     
-- Windows management -- 
-------------------------     
-- Basic controls
keymap.set("n", "<leader>w|", "<C-w>v", { desc = "Split window vertically"})
keymap.set("n", "<leader>w-", "<C-w>s", { desc = "Split window horizontally"})
keymap.set("n", "<leader>wq", "<cmd>close<CR>", { desc = "Close current split"})
keymap.set("n", "<leader>ww", "<C-w>w", {desc= "Switch to another windows"})
keymap.set("n", "<leader>wr", "<C-w>r", {desc= "Rotate"}) -- 

--  Moving to other windows
keymap.set("n", "<leader>l", "<C-w>l", {desc= "Move to Left"}) 
keymap.set("n", "<leader>h", "<C-w>h", {desc= "Move to Right"}) 
keymap.set("n", "<leader>k", "<C-w>k", {desc= "Move to Up"}) 
keymap.set("n", "<leader>j", "<C-w>j", {desc= "Move to Bottom"}) 

--  Switch windows
keymap.set("n", "<leader>wl", "<C-w>L", {desc= "Switch current window to Left"}) 
keymap.set("n", "<leader>wh", "<C-w>H", {desc= "Switch current window to Right"}) 
keymap.set("n", "<leader>wk", "<C-w>K", {desc= "Switch current window to Up"}) 
keymap.set("n", "<leader>wj", "<C-w>J", {desc= "Switch current window to Bottom"}) 
keymap.set("n", "<leader>wp", "<C-w>p", {desc= "Switch to previous window"}) 

-- Resize windows
keymap.set("n", "<leader>z", "<C-w>|", {desc= "[Z]oom current window"}) 
keymap.set("n", "<leader>u", "<C-w>=", {desc= "[U]nZoom current window (Equal sizes)"}) 

-- Delete OTHER windows (Like Emacs)
keymap.set("n", "<leader>wo", "<C-w>o", {desc = "Delete [O]THER windows (Emacs)"})

-- Tmux sessionzier
-- keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")