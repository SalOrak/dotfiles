local k = vim.keymap

local opts = function(desc)
	return { buffer = bufnr, desc = desc }
end

if pcall(require, "telekasten") then
	local tk = require("telekasten")
	k.set({ "n", "v" }, "<localleader>i", tk.insert_link, opts("Kasten: Insert Link"))
	k.set({ "n", "v" }, "<localleader>o", tk.follow_link, opts("Kasten: Follow Link"))
	k.set({ "n", "v" }, "<localleader>r", tk.rename_note, opts("Kasten: Rename note"))
	k.set({ "n", "v" }, "<localleader>q", tk.toggle_todo, opts("Kasten: Toggle todo"))
	k.set({ "n", "v" }, "<localleader>b", tk.show_backlinks, opts("Kasten: Show backlinks"))
	k.set({ "n", "v" }, "<localleader>t", tk.show_tags, opts("Kasten: Show tags"))
	k.set({ "n", "v" }, "<localleader>f", tk.find_friends, opts("Kasten: Find friends"))
	k.set({ "n", "v" }, "<localleader>y", tk.yank_notelink, opts("Kasten:Yank NoteLink"))
end

-- Table Mode for markdown (http://github.com/dhruvasagar/vim-table-mode)
if vim.g.loaded_table_mode then
	vim.cmd("TableModeEnable")
	k.set(
		{ "n", "v" },
		"<localleader>tr",
		":call tablemode#table#Realign('.')",
		{ desc = "[Table] Realign" },
		{ desc = "[Table] Realign" }
	)
	k.set(
		{ "n", "v" },
		"<localleader>ts",
		":call tablemode#spreadsheet#Sort(<bang>0,<q-args>)",
		{ desc = "[Table] Sort" }
	)
	k.set({ "n", "v" }, "<localleader>tdr", ":call tablemode#spreadsheet#DeleteRow()", {
		desc = "[Table] Delete row",
	})
	k.set(
		{ "n", "v" },
		"<localleader>tdc",
		":call tablemode#spreadsheet#DeleteColumn()",
		{ desc = "[Table] Delete column" }
	)
	k.set(
		{ "n", "v" },
		"<localleader>tic",
		":call tablemode#spreadsheet#InsertColumn(1)",
		{ desc = "[Table] Insert column after" }
	)
end

k.set({ "n", "v" }, "<localleader>d", function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0)) -- Get the current cursor position
	local date = os.date("%d %B %Y")
	vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { date })
end, opts("Insert date"))
