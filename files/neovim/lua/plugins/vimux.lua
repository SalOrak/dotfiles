return {
	"preservim/vimux",
	config = function()
		local global = vim.g
		local log = require("plenary.log")
		global.VimuxOrientation = "h"
		global.VimuxHeight= "35%"
		global.VimuxPromptString = "Compile >> "
		global.VimuxRunnerType = "pane"
		global.VimuxRunnerName= "[Compile]"
        vim.api.nvim_create_user_command(
            "VimuxRunInCurrentFile",
            function(opts)
                local bufnr = vim.api.nvim_get_current_buf()
                local bufname = vim.api.nvim_buf_get_name(bufnr):gsub("^oil://", "")
                local cmd = table.concat(opts.fargs, " ") .. " \'" .. bufname .."\'"
                vim.api.nvim_cmd(
                    vim.api.nvim_parse_cmd("call VimuxRunCommand(\"" .. cmd.. "\")", {}), 
                    {})
                end, {nargs = 1})
	end,

}
