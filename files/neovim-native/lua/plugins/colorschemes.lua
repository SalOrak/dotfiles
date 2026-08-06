local ok, _ = pcall(require,"catppuccin")

if not ok then return end


vim.cmd.colorscheme("catppuccin-mocha")
