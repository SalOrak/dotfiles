local k = vim.keymap

-- To execute a normal command
norm = function(cmd)
	return "<cmd>norm " .. cmd .. "<CR>"
end

-- To execute a command
cmd = function(cmd)
	return "<cmd>" .. cmd .. "<CR>"
end

-- Keep centered while page scrolling 
k.set({"n"}, "<C-d>", "<C-d>zz")
k.set({"n"}, "<C-u>", "<C-u>zz")

-- Replace q: for : 
k.set({"n"}, ":", "q:", {remap = true})

-- Window Management
-- Windows are managed by prefix everything with CTRL-W
-- r -> Rotate windows in the same column / row
-- x -> Exchange current window with the next one.
-- b -> Go to bottom-right window
-- t -> Go to top-left window
-- p -> Go to previous (last accessed) window
-- w -> Switch to the other window (clockwise)
-- W -> Switch to the other window (counter-clockwise)
-- H -> Move current window to be at the far left
-- L -> Move current window to be at the far right
-- J -> Move current window to be at the very bottom
-- K -> Move current window to be at the very top

-- T -> Move current window to a new tab page (rebinded)
k.set({"n"}, "<C-w>T","<C-w>w")

-- Fzf Lua
k.set({"n"}, "<leader>f", cmd("FzfLua files"))
k.set({"n"}, "<leader>g", cmd("FzfLua git_files"))
k.set({"n"}, "<leader>r", cmd("FzfLua live_grep"))
k.set({"n"}, "<leader>b", cmd("FzfLua buffers"))

-- Telescope Extensions: Whaler
local w = require('telescope')
k.set({"n"}, "<leader>p", w.extensions.whaler.whaler)

-- Oil 
k.set({"n"}, "<leader>d", cmd("Oil")) 

k.set({"n"}, "<localleader>d", cmd("Oil")) 
