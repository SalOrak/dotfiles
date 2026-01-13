local ok, Organize = pcall(require, 'orak.organize')

if not ok then
	vim.notify("[Custom]: orak.nvim not found", vim.log.levels.ERROR)
	return
end

local Template = require'orak.common.template'

local M = {
	data = {
		projects_filename = "Projects.md"
	}
}

M.open_projects = function()
	Organize.open_custom("",M.data.projects_filename, "projects") 
end

M.organize_find = function()
	local ok, t = pcall(require, 'telescope.builtin')
	if not ok then
		vim.notify("[Custom-Orak] Teslecope not found")
		return
	end
	t.find_files({ cwd = Organize.get_base_path() })
end

M.capture_box_toggle_or_create= function()

	local pattern = "^%-- %[[ Xx]%]"
	local current_line = vim.api.nvim_get_current_line()

	--- If found, that means there is a checkbox already.
	if current_line:match(pattern) then
		vim.cmd("MDTaskToggle")
		return
	end

	--- Else create the checkbox
	local data = "- [ ] " .. current_line
	local bufnr = vim.api.nvim_get_current_buf()
	local line_num = vim.fn.getpos('.')[2]
	vim.api.nvim_set_current_line(data)
	vim.api.nvim_win_set_cursor(0, {line_num, #data})
end

M.project_go_and_create = function()

	local bufname = vim.fn.bufname()
	local projects_filepath = vim.fs.normalize(Organize.get_base_path())
	projects_filepath = string.format("%s/%s", projects_filepath, M.data.projects_filename)

	if bufname ~= projects_filepath then
		-- Jump to the projects file if not opened.
		vim.notify("Jumping to the projects file", vim.log.levels.WARN)
		P(bufname)
		P(projects_filepath)
		M.open_projects()
	end

	--- Insert a new Project 'template' in current line
	local week_path = Organize.get_week_file_path()
	local week_number = os.date('%V') % 4
	local week_data = string.format("[Week %s](%s)", week_number, week_path)
	local data = Template.new({enclose = "-", eq = ":", reverse = true})
	data = data:withHeader("created-date", "{date:%d-%m-%Y}"):withHeader("week-path", week_data):withHeader("description", ""):withBody("###  "):build()

	local bufnr = vim.api.nvim_get_current_buf()
	local line_num = 5
	local lines = vim.split(data, "\n")
	vim.api.nvim_buf_set_lines(bufnr, line_num, line_num, false, lines)

	vim.api.nvim_win_set_cursor(0, {line_num + 2, 4})

	--- Get into insert mode
	vim.cmd("startinsert")
end


return M
