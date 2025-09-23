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
k.set({"n", "v"}, "<C-d>", "<C-d>zz")
k.set({"n", "v"}, "<C-u>", "<C-u>zz")

-- Replace q: for : 
--
vim.cmd("")
k.set({"n"}, ":", "q:", {remap = true, desc = "Command Line Window"})


-- Replace Esc to C-c
k.set({"n", "i", "v"}, "<C-c>", "<Esc>", { noremap = true, silent = true, desc = "Escape"})
vim.api.nvim_create_autocmd("CmdwinEnter", {
  group = vim.api.nvim_create_augroup("CmdwinMaps", { clear = true }),
  callback = function()
      k.set({"i"}, "<C-c>", "<Esc>", { buffer = true, noremap = true, silent = true})
      k.set({"n"}, "<C-c>", "<c-w>c", { buffer = true, noremap = true, silent = true})
  end,
})

k.set({"n", "v"}, "<leader>:", ":", {desc = "Normal Command Line"})

-- -- Copy parent directory path
-- k.set({"n"}, "<leader>yy", function() vim.fn.setreg("+", vim.fn.expand("%:p")) end, {desc = "Copy parent dir path"})
-- -- Copy Whaler directory project path
-- k.set({"n"}, "<leader>yw", function() 
--     local path, _ = require('telescope').extensions.whaler.get_current_project()
--     vim.fn.setreg("+", path) 
-- end, {desc = "Copy Whaler project path"})

-- Error using quickfix
k.set({"n", "v", "i"}, "<M-n>", cmd("cnext") .. "zz", {desc = "Next Error"})
k.set({"n", "v", "i"}, "<M-p>", cmd("cprev") .. "zz", {desc = "Previous Error"})
k.set({"n", "v"}, "<leader>1", cmd("cope"), {desc = "Open Quickfix"})
k.set({"n", "v"}, "<leader>2", cmd("ccl"),  {desc = "Close Quickfix"})

k.set({"n", "v"}, "<leader>w", cmd("make"),  {desc = "Compile"})
    
-- T -> Move current window to a new tab page (rebinded)
k.set({"n"}, "<C-w>T","<C-w>w")

-- Telescope
local man_pages = function()
    local builtin = require'telescope.builtin'
    builtin.man_pages({sections = { "ALL"}})
end

k.set({"n"}, "<leader>f", cmd("Telescope find_files"), {desc = "Find files"})
k.set({"n"}, "<leader>gf", cmd("Telescope git_files"), {desc = "Git Find Files"})
k.set({"n"}, "<leader>r", cmd("Telescope live_grep"), {desc = "Grep"})
k.set({"n"}, "<leader>a", cmd("Telescope buffers"), {desc = "Opened buffer"})
k.set({"n"}, "<leader>M", man_pages, {desc = "Manpages"})
k.set({"n"}, "<leader>K", cmd("Telescope keymaps"), {desc = "Keymaps"})
k.set({"n"}, "<leader>H", cmd("Telescope help_tags"), {desc = "Help pages"})

-- Scratchpad functionality
k.set({"n"}, "<leader>o", cmd("e ~/.scratchpad.lua"), {desc = "Go to Lua Scratchpad"})
k.set({"n"}, "<leader>O", cmd("so"), {desc = "[so]urce current file"})

-- -- Telescope Extensions: Whaler
k.set( {"n"}, "<leader>p", require('telescope').extensions.whaler.whaler, { desc = "Whaler"})

-- Execute whaler without changing cwd
k.set({"n"}, "<leader>P", function()
	require('telescope').extensions.whaler.whaler ({
		auto_cwd = false
	})
	end,
    { desc = "[Whaler] No switch"}
)

-- Find file using whaler without changing current_working directory
k.set({"n"}, "<leader>F", function()
	local w = require('telescope')
	w.extensions.whaler.whaler ({
		auto_cwd = false,
		auto_file_explorer = true,
		file_explorer_config = {
			plugin_name = "netrw",
			command = "Telescope find_files cwd=",
			prefix_dir = "",
		},
	})
	end,
    { desc = "[Whaler] Other Find file"}
)

-- Grep using whaler without changing current_working directory
k.set({"n"}, "<leader>R", function()
	local w = require('telescope')
	w.extensions.whaler.whaler ({
		auto_cwd = false,
		auto_file_explorer = true,
		file_explorer_config = {
			plugin_name = "netrw",
			command = "Telescope live_grep cwd=",
			prefix_dir = "",
		},
	})
	end, 
    { desc = "[Whaler] Other Live Grep"}
)



-- Oil 
k.set({"n"}, "<leader>d", function()
    require('oil').open()
end, {desc = "Oil"}) 

k.set({"n"}, "<leader>D", 
    function()
        local oil = require('oil')
        local cwd = { 
            path = vim.fn.expand("%:h"),
            display = vim.fn.expand("%:h")
        }
        require('telescope').extensions.whaler.switch({ path = cwd, display = cwd})
        oil.open(cwd.path,nil,nil)
        require('oil.actions').cd.callback("win",true)
    end, { desc = "Whaler: Switch here"})

-- Custom:
-- Tmux navigation
vim.keymap.set({"n"}, "<M-j>", function() tmux_select_pane("Down") end)
vim.keymap.set({"n"}, "<M-k>", function() tmux_select_pane("Up") end)
vim.keymap.set({"n"}, "<M-h>", function() tmux_select_pane("Left") end)
vim.keymap.set({"n"}, "<M-l>", function() tmux_select_pane("Right") end)


-- Neogit
vim.keymap.set({"n"}, "<leader>gg", function()
    local neogit = require('neogit')
    neogit.open({kind = "replace"})
end, {desc = "NeoGit"})


-- Telekasten
vim.keymap.set({"n"}, "<leader>nq", require'telekasten'.new_note, {desc = "Kast: New"})
vim.keymap.set({"n"}, "<leader>nf", require'telekasten'.find_notes, {desc = "Kast: Find"}) 
vim.keymap.set({"n"}, "<leader>ns", require'telekasten'.search_notes, {desc = "Kast: Grep"})
vim.keymap.set({"n"}, "<leader>nd", require'telekasten'.find_daily_notes, {desc ="Kast: Find Daily"}) 
vim.keymap.set({"n"}, "<leader>nt", require'telekasten'.goto_today, {desc = "Kast: Daily"})
vim.keymap.set({"n"}, "<leader>nw", require'telekasten'.goto_thisweek, {desc = "Kast: Weekly"})
vim.keymap.set({"n"}, "<leader>ne", require'telekasten'.switch_vault, {desc = "Kast: Weekly"})


-- Work keymaps
vim.keymap.set({"n", "v"}, "<leader>x", ":e ~/work/proven/DAILY-AGENDA.md<CR>", {desc = "[Work] Daily agenda"})

-- Terminal
-- Go to normal mode. I'd like it to be C-c but that's not possible here.
vim.keymap.set("t", "<c-x>", "<c-\\><c-n>") 

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", "<leader>s", function()
  vim.cmd.new()
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)

-- Plugin Lua development
local testKeymap = function()
    vim.cmd('VimuxSendKeys "Enter"')
end

vim.keymap.set({"n", "v"}, "<leader><leader>x", testKeymap)

