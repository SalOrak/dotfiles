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


-- Windows management
keymap.set("n", "<leader>w|", "<C-w>v", { desc = "Split window vertically"})
keymap.set("n", "<leader>w-", "<C-w>s", { desc = "Split window horizontally"})
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split"})
keymap.set("n", "<leader>ww", "<C-w>w", {desc= "Switch to another windows"})


-- Tmux sessionzier
-- keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
