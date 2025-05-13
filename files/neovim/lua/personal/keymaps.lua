local k = vim.keymap

norm = function(cmd)
	return "<cmd>norm " .. cmd .. "<CR>"
end

cmd = function(cmd)
	return "<cmd>" .. cmd .. "<CR>"
end


k.set({"i"}, "<C-f>", norm("l"))
k.set({"i"}, "<M-f>", norm("w"))
k.set({"i"}, "<C-b>", norm("h"))
k.set({"i"}, "<M-b>", norm("b"))

-- Telescope
local t = require('telescope.builtin')
local w = require('telescope')
k.set({"n", "i"}, "<C-s>", t.find_files)
k.set({"n", "i"}, "<M-w>", w.extensions.whaler.whaler)

-- Oil 
k.set({"n"}, "<leader>e", cmd("Oil"))

