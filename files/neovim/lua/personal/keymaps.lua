local k = vim.keymap
local wk = require("which-key")

-- To execute a normal command
norm = function(cmd)
	return "<cmd>norm " .. cmd .. "<CR>"
end

-- To execute a command
cmd = function(cmd)
	return "<cmd>" .. cmd .. "<CR>"
end

-- Keep centered while page scrolling
k.set({ "n", "v" }, "<C-d>", "<C-d>zz")
k.set({ "n", "v" }, "<C-u>", "<C-u>zz")

--W Replace q: for :
k.set({ "n" }, ":", "q:", { remap = true, desc = "Command Line Window" })

-- replace esc to c-c
k.set({ "n", "i", "v" }, "<c-c>", "<esc>", { noremap = true, silent = true, desc = "escape" })
vim.api.nvim_create_autocmd("cmdwinenter", {
	group = vim.api.nvim_create_augroup("cmdwinmaps", { clear = true }),
	callback = function()
		k.set({ "i" }, "<c-c>", "<esc>", { buffer = true, noremap = true, silent = true })
		k.set({ "n" }, "<c-c>", "<c-w>c", { buffer = true, noremap = true, silent = true })
	end,
})

k.set({ "n", "v" }, "<leader>:", ":", { desc = "Normal Command Line" })

-- -- Copy parent directory path
-- k.set({"n"}, "<leader>yy", function() vim.fn.setreg("+", vim.fn.expand("%:p")) end, {desc = "Copy parent dir path"})
-- -- Copy Whaler directory project path
-- k.set({"n"}, "<leader>yw", function()
--     local path, _ = require('telescope').extensions.whaler.get_current_project()
--     vim.fn.setreg("+", path)
-- end, {desc = "Copy Whaler project path"})

-- Error using quickfixkey
k.set({ "n", "v", "i" }, "<M-n>", cmd("cnext") .. "zz", { desc = "Next Error" })
k.set({ "n", "v", "i" }, "<M-p>", cmd("cprev") .. "zz", { desc = "Previous Error" })
k.set({ "n", "v" }, "<leader>1", cmd("cope"), { desc = "Open Quickfix" })
k.set({ "n", "v" }, "<leader>2", cmd("ccl"), { desc = "Close Quickfix" })


wk.add({
	{ "<leader>w", group = "[Make]" }, -- group
})
k.set({ "n", "v" }, "<leader>we", ":make ", { desc = "Edit" })
k.set({ "n", "v" }, "<leader>ww", ":make build<CR>", { desc = "Build" })
k.set({ "n", "v" }, "<leader>wr", ":make run<CR>", { desc = "Run" })
k.set({ "n", "v" }, "<leader>wt", ":make test<CR>", { desc = "Test" })

-- T -> Move current window to a new tab page (rebinded)
k.set({ "n" }, "<C-w>T", "<C-w>w")

-- Telescope
local man_pages = function()
	local builtin = require("telescope.builtin")
	builtin.man_pages({ sections = { "ALL" } })
end

--- Manual: switchbuf options
--- C-W f opens a file!! Try it out
k.set({ "n" }, "<leader>f", cmd("Telescope find_files"), { desc = "Find files" })
k.set({ "n" }, "<leader>r", cmd("Telescope live_grep"), { desc = "Grep" })
k.set({ "n" }, "<leader>a", cmd("Telescope buffers"), { desc = "Opened buffer" })
k.set({ "n" }, "<leader>M", man_pages, { desc = "Manpages" })
k.set({ "n" }, "<leader>H", cmd("Telescope help_tags"), { desc = "Help pages" })

--- Find files and Grep in the current working directory
local tele_builtin = require("telescope.builtin")
local tele_utils = require("telescope.utils")

local sanitize_path = function(path)
    local sanitized_path = string.gsub(path, "oil://", "")
    return sanitized_path
end

local find_files_current = function()
	tele_builtin.find_files({ cwd = sanitize_path(tele_utils.buffer_dir()) })
end
local git_files_current = function()
	tele_builtin.git_files({ cwd = sanitize_path(tele_utils.buffer_dir())})
end
local grep_current = function()
	tele_builtin.live_grep({ cwd = sanitize_path(tele_utils.buffer_dir()) })
end

wk.add({
	{ "<leader>.", group = "[Current directory]" }, -- group
})
k.set({ "n" }, "<leader>.f", find_files_current, { desc = "Find files" })
k.set({ "n" }, "<leader>.g", git_files_current, { desc = "Git Find Files" })
k.set({ "n" }, "<leader>.r", grep_current, { desc = "Grep" })

-- Scratchpad functionality
k.set({ "n" }, "<leader>o", cmd("e ~/.scratchpad.lua"), { desc = "Go to Lua Scratchpad" })
k.set({ "n" }, "<leader>O", cmd("so"), { desc = "[so]urce current file" })

-- -- Telescope Extensions: Whaler
k.set({ "n" }, "<leader>p", require("telescope").extensions.whaler.whaler, { desc = "Whaler" })


-- Find file using whaler without changing current_working directory
k.set({ "n" }, "<leader>F", function()
	local w = require("telescope")
	w.extensions.whaler.whaler({
		auto_cwd = false,
		auto_file_explorer = true,
		file_explorer_config = {
			plugin_name = "netrw",
			command = "Telescope find_files cwd=",
			prefix_dir = "",
		},
	})
end, { desc = "[Whaler] Other Find file" })

-- Grep using whaler without changing current_working directory
k.set({ "n" }, "<leader>R", function()
	local w = require("telescope")
	w.extensions.whaler.whaler({
		auto_cwd = false,
		auto_file_explorer = true,
		file_explorer_config = {
			plugin_name = "netrw",
			command = "Telescope live_grep cwd=",
			prefix_dir = "",
		},
	})
end, { desc = "[Whaler] Other Live Grep" })

-- Oil
k.set({ "n" }, "<leader>d", function()
	require("oil").open()
end, { desc = "Oil" })


k.set({"n"}, "<leader>s", function()
    local w = require'telescope'.extensions.whaler
    local r = w.root()
    local path = r.root -- The path
    local readme = path .. "/README.md"
    vim.cmd("e " .. readme)
end, {
desc = "[Whaler] README.md"
})

-- Custom:
-- Tmux navigation
vim.keymap.set({ "n" }, "<M-h>", function()
	tmux_select_pane("Left")
end)

vim.keymap.set({ "n" }, "<M-l>", function()
	tmux_select_pane("Down")
end)

-- Tmux automatically converts <M-;> to <Space><shift>y (<leader>Y)
vim.keymap.set({ "n" }, "<leader>Y", function()
	local w = require("telescope").extensions.whaler
	local tmux = require("libtmux")

	local wroot = w.root()
	local path, display = wroot.root, wroot.root_display 

    -- If path is null, odd but can happen
    -- just move to the next available window
    if path == nil and not tmux:next_window({}) then
        tmux:new_window({
            and_select= true
        })
        return
    end

    -- Normalize path
    path = vim.fs.abspath(path);

    -- In case display is nil, get the last 2 directories as its name
    -- This generates smaller window names and avoid cluttering tmux
    if display == path then
        display = "[-] " .. strip_path_from_end(path, 2)
    end

	tmux:new_window({
		name = "*" .. display,
		start_directory = path,
		and_select = true,
	})
end, { desc = "[Tmux]: Select project window" })

vim.keymap.set({ "n" }, "<leader>c", function()
	local tmux = require("libtmux")
	local windows = tmux:list_windows({ format = "#{window_name}" })
	for _, name in pairs(windows) do
		--- Delete windows that start with * which are associated with projects
		if name ~= "" and string.sub(name, 0, 1) == "*" then
			tmux:kill_window({ window = name })
		end
	end
end, { desc = "[Tmux]: Delete ALL project windows" })

-- (Custom) Notes
local Note = require("note")
local Template = require("note.template")
local fmYaml = Template.PRESET.frontMatterYamlMarkdown
local fmToml = Template.PRESET.frontMatterTomlMarkdown

wk.add({
	{ "<leader>n", group = "[Note]" }, -- group
})

vim.keymap.set({ "n", "v" }, "<leader>nn", function()
	Note.note(fmToml)
end, { desc = "[Note]: New note" })

vim.keymap.set({ "n", "v" }, "<leader>nt", function()
	Note.telescope_note()
end, { desc = "[Note]: Find notes" })

vim.keymap.set({ "n", "v" }, "<leader>lt", function()
	vim.cmd(":e ~/personal/notes/personal-curriculums/2025/TODO.md")
end, { desc = "[PC]: TODO" })

vim.keymap.set({ "n", "v" }, "<leader>ll", function()
	vim.cmd(":e ~/personal/notes/personal-curriculums/2025/LOG.md")
end, { desc = "[PC]: Log" })

vim.keymap.set({ "n", "v" }, "<leader>ln", function()
	vim.cmd(":e ~/personal/notes/personal-curriculums/2025/NOTES.md")
end, { desc = "[PC]: Notes" })


-- (Custom) Mistah Tsosing issue sin cod
local huid = require("huid")

vim.keymap.set({ "n", "v" }, "<leader>ha", function()
    huid.tasks_create_from_todo()
end, { desc = "[HUID]: New" })

vim.keymap.set({ "n", "v" }, "<leader>hh", function()
    huid.tasks_find_by_huid(nil)
end, { desc = "[HUID]: Go" })

-- Terminal
-- Go to normal mode. I'd like it to be C-c but that's not possible here.
vim.keymap.set("t", "<c-x>", "<c-\\><c-n>")

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", "<leader>A", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 12)
	vim.wo.winfixheight = true
	vim.cmd.term()
	vim.keymap.set({ "n", "v" }, "<localleader>q", function()
		vim.cmd.wincmd("q")
	end, { buffer = bufnr, desc = "Exit" })
end)

-- Plugin Lua development
local testKeymap = function()
	vim.cmd("Lazy reload libtmux.nvim")
	vim.cmd("Lazy reload note.nvim")
end

vim.keymap.set({ "n", "v" }, "<leader><leader>x", testKeymap)
