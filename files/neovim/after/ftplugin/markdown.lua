local k = vim.keymap

local opts = function(desc)
	return { buffer = true, desc = desc }
end

-- Table Mode for markdown (http://github.com/dhruvasagar/vim-table-mode)

-- Enable TableMode always
k.set({ "n", "v" }, "<localleader>te", ":call tablemode#Enable()<CR>", { desc = "[Table] Enable Table Mode", buffer = true })

if vim.g.loaded_table_mode then
	vim.cmd("TableModeEnable")
	k.set({ "n", "v" }, "<localleader>tr", ":call tablemode#table#Realign('.')<CR>", { desc = "[Table] Realign", buffer = true })

	k.set({ "n", "v" }, "<localleader>r", ":call tablemode#table#Realign('.')<CR>", { desc = "[Table] Realign", buffer = true })

	k.set(
		{ "n", "v" },
		"<localleader>ts",
		":call tablemode#spreadsheet#Sort(<bang>0,<q-args>)<CR>",
		{ desc = "[Table] Sort", buffer = true }
	)

	k.set({ "n", "v" }, "<localleader>tdr", ":call tablemode#spreadsheet#DeleteRow()", {
		desc = "[Table] Delete row", buffer = true
	})
	k.set(
		{ "n", "v" },
		"<localleader>tdc",
		":call tablemode#spreadsheet#DeleteColumn()<CR>",
		{ desc = "[Table] Delete column", buffer = true }
	)
	k.set(
		{ "n", "v" },
		"<localleader>tic",
		":call tablemode#spreadsheet#InsertColumn(1)<CR>",
		{ desc = "[Table] Insert column after", buffer = true }
	)

	k.set(
		{ "n", "v" },
		"<localleader>tfe",
		":call tablemode#spreadsheet#formula#EvaluateFormulaLine()<CR>",
		{ desc = "[Table] Evaluate formula line", buffer = true }
	)

	k.set(
		{ "n", "v" },
		"<localleader>fe",
		":call tablemode#spreadsheet#formula#EvaluateFormulaLine()<CR>",
		{ desc = "[Table] Evaluate formula line", buffer = true }
	)
	k.set(
		{ "n", "v" },
		"<localleader>tfa",
		":call tablemode#spreadsheet#formula#Add()<CR>",
		{ desc = "[Table] Add formula line", buffer = true}
	)

	k.set(
		{ "n", "v" },
		"<localleader>fa",
		":call tablemode#spreadsheet#formula#Add()<CR>",
		{ desc = "[Table] Add formula line", buffer = true}
	)
end

k.set(
    { "n", "v" },
    "<localleader>c",
    ":MDTaskToggle<CR>",
    { desc = "[Box] Toggle ", buffer = true}
)

k.set(
    { "n", "v" },
    "<localleader>n",
    ":MDListItemBelow<CR>",
    { desc = "[Box] New below ", buffer = true}
)

k.set(
    { "n", "v" },
	"<localleader>i",function()
		--- Insert a new Project 'template' in current line
		local Template = require'orak.common.template'
		local week_path = require'orak.organize'.get_week_file_path()
		local week_number = os.date('%V') % 4
		local week_data = string.format("[Week %s](%s)", week_number, week_path)
		local data = Template.new({enclose = "-", eq = ":", reverse = true})
		data = data:withHeader("created-date", "{date:%d-%m-%Y}"):withHeader("week-path", week_data):withHeader("description", ""):withBody("## "):build()

		local bufnr = vim.api.nvim_get_current_buf()
		local line_num = 5
		local lines = vim.split(data, "\n")
		vim.api.nvim_buf_set_lines(bufnr, line_num, line_num, false, lines)
		vim.api.nvim_win_set_cursor(0, {line_num + 2,3})
	end,
    { desc = "[Projects] Insert new project", buffer = true}
)

k.set({ "n", "v" }, "<localleader>d", function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0)) -- Get the current cursor position
	local date = os.date("%d %B %Y")
	vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { date })
end, opts("Insert date"))
