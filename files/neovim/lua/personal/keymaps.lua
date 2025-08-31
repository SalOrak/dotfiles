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
k.set({"n"}, ":", "q:", {remap = true})

-- Replace Esc to C-c
k.set({"n", "i", "v"}, "<C-c>", "<Esc>", { noremap = true, silent = true})
vim.api.nvim_create_autocmd("CmdwinEnter", {
  group = vim.api.nvim_create_augroup("CmdwinMaps", { clear = true }),
  callback = function()
      k.set({"i"}, "<C-c>", "<Esc>", { noremap = true, silent = true})
      k.set({"n"}, "<C-c><C-c>", "<Esc>q<CR>", { noremap = true, silent = true})
  end,
})

k.set({"n", "v"}, "<leader>:", ":", {desc = "Normal Command Line"})



-- Copy parent directory path
k.set({"n"}, "<leader>yy", function() vim.fn.setreg("+", vim.fn.expand("%:p")) end, {desc = "Copy parent dir path"})
-- Copy Whaler directory project path
k.set({"n"}, "<leader>yw", function() 
    local path, _ = require('telescope').extensions.whaler.get_current_project()
    vim.fn.setreg("+", path) 
end, {desc = "Copy Whaler project path"})

-- Error using quickfix
k.set({"n"}, "<C-n", cmd("cnext") .. "zz")
k.set({"n"}, "<C-p", cmd("cprev") .. "zz")

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
k.set({"n"}, "<leader>gf", cmd("FzfLua git_files"))
k.set({"n"}, "<leader>r", cmd("FzfLua live_grep_native"))
k.set({"n"}, "<leader>M", cmd("FzfLua manpages"))
k.set({"n"}, "<leader>K", cmd("FzfLua keymaps"))
k.set({"n"}, "<leader>H", cmd("FzfLua helptags"))
k.set({"n"}, "<leader>a", cmd("FzfLua buffers"))
k.set({"n"}, "<leader><leader>P", cmd("FzfLua profiles"))
k.set({"n"}, "<leader><leader>Q", cmd("FzfLua builtin"))

-- Scratchpad functionality
k.set({"n"}, "<leader>o", cmd("e ~/.scratchpad.lua"), {desc = "Go to Lua Scratchpad"})
k.set({"n"}, "<leader>O", cmd("so"), {desc = "[so]urce current file"})

-- Vimux 
k.set({"n"}, "<leader>s", function()
    vim.api.nvim_cmd(vim.api.nvim_parse_cmd("VimuxClearTerminalScreen", {}), {})
    vim.api.nvim_cmd(vim.api.nvim_parse_cmd("VimuxRunLastCommand", {}), {})
end,
{ desc = "[Vimux] Run last command"}

)


k.set({"n"}, "<leader>3", cmd("VimuxTogglePane"), {desc = "[Vimux] Toggle pane"})
k.set({"n"}, "<leader>Y", cmd("VimuxZoomRunner"),{desc = "[Vimux] Zoom"})
k.set({"n"}, "<leader>e", cmd("VimuxInspectRunner"), {desc = "[Vimux] Inspect"})

-- Telescope Extensions: Whaler
k.set(
    {"n"}, 
    "<leader>p", 
    require('telescope').extensions.whaler.whaler, 
    { desc = "[Whaler]"}
)


-- Execute command on current Whaler project or PWD
k.set({"n"}, "<leader>q", function()
    local cwd, display = require('telescope').extensions.whaler.get_current_project()
	vim.api.nvim_set_current_dir(cwd)
	vim.g.VimuxOpenExtraArgs = "-c " .. cwd
	vim.api.nvim_cmd(vim.api.nvim_parse_cmd("call VimuxRunCommand(\"" .."cd " .. cwd ..";clear".. "\")" , {}), {})
	vim.ui.input({ prompt = "" .. display .. " -- Compile >> ", default = "", completion = "shellcmd" }, function(user_command)
        if not user_command then
            vim.g.VimuxOpenExtraArgs = ""
            return
        end
        vim.api.nvim_cmd(vim.api.nvim_parse_cmd("call VimuxRunCommand(\"" .. user_command .. "\")" , {}), {})
        vim.g.VimuxOpenExtraArgs = ""
    end)
end,
{ desc = "[Vimux] Execute command on current Whaler project or directory"}
)

-- Execute command on current file or PWD
k.set({"n"}, "<leader>w", function()
    local cwd, _ = require('telescope').extensions.whaler.get_current_project()
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
    vim.g.VimuxOpenExtraArgs = "-c " .. cwd
    vim.ui.input({ prompt = "" .. filename.. " -- Compile >> ", default = "", completion = "shellcmd" }, function(user_command)
        if not user_command then
            vim.g.VimuxOpenExtraArgs = ""
            return
        end
        vim.api.nvim_cmd(vim.api.nvim_parse_cmd("VimuxRunInCurrentFile " .. user_command , {}), {})
        vim.g.VimuxOpenExtraArgs = ""
    end)
end,
{ desc = "[Vimux] Execute command on current file or directory"}
)

-- Execute whaler without changing cwd
k.set({"n"}, "<leader>P", function()
	require('telescope').extensions.whaler.whaler ({
		auto_cwd = false
	})
	end,
    { desc = "[Whaler] Preserves CWD"}
)

-- Find file using whaler without changing current_working directory
k.set({"n"}, "<leader>F", function()
	local w = require('telescope')
	w.extensions.whaler.whaler ({
		auto_cwd = false,
		auto_file_explorer = true,
		file_explorer_config = {
			plugin_name = "netrw",
			command = "FzfLua files cwd=",
			prefix_dir = "",
		},
	})
	end,
    { desc = "[Whaler] Find file in another Whaler project"}
)

-- Grep using whaler without changing current_working directory
k.set({"n"}, "<leader>R", function()
	local w = require('telescope')
	w.extensions.whaler.whaler ({
		auto_cwd = false,
		auto_file_explorer = true,
		file_explorer_config = {
			plugin_name = "netrw",
			command = "FzfLua live_grep cwd=",
			prefix_dir = "",
		},
	})
	end, 
    { desc = "[Whaler] Live Grep in another Whaler project"}
)

-- Oil 
k.set({"n"}, "<leader>d", cmd("Oil"), {desc = "Oil Parent directory"}) 
k.set({"n"}, "<localleader>d", 
    function()
        local oil = require('oil')
        local cwd = { 
            path = vim.fn.expand("%:h"),
            display = vim.fn.expand("%:h")
        }
        require('telescope').extensions.whaler.whaler_select_project(cwd)
        oil.open(cwd.path,nil,nil)
        require('oil.actions').cd.callback("win",true)
    end, { desc = "Sets current directory as whaler directory"})


-- Custom:
-- Tmux navigation
vim.keymap.set({"n"}, "<M-j>", function() tmux_select_pane("Down") end)
vim.keymap.set({"n"}, "<M-k>", function() tmux_select_pane("Up") end)
vim.keymap.set({"n"}, "<M-h>", function() tmux_select_pane("Left") end)
vim.keymap.set({"n"}, "<M-l>", function() tmux_select_pane("Right") end)


-- Neogit
vim.keymap.set({"n"}, "<leader>gg", cmd("Neogit"), {desc = "NeoGit"})

-- Plugin Lua development
vim.keymap.set({"n"}, "<leader><leader>o", ":AnsibleDoc<CR>")

local testKeymap = function()
    vim.cmd('VimuxSendKeys "Enter"')
end

vim.keymap.set({"n", "v"}, "<leader><leader>x", testKeymap)

