return {
    -- "figsoda/nix-develop.nvim",
	-- "salorak/nix-dev.nvim",
	dir = "/home/hector/personal/nix-dev.nvim",
	config = function()
		local nixdev = require'nix-dev'
		nixdev.setup({})

		local dunstify = function(urgency, body, msg)
			local urgency = urgency or "normal"
			local cmd = {
				"dunstify",
				"--icon=nvim",
				"--urgency=" .. urgency,
				string.format("%s", body),
				string.format("%s", msg)
			}

			vim.system(cmd):wait()
		end

		local augroup = vim.api.nvim_create_augroup('nixdevevents', {clear =true})

		vim.api.nvim_create_autocmd("User", {
			pattern = "NixDevPre",
			group = augroup,
			callback = function(ev)
				local data = ev.data
				dunstify("low", "Direnv: Activating environment", string.format("In path: \"%s\"", data.path))
			end
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "NixDevPost",
			group = augroup,
			callback = function(ev)
				local data = ev.data
				if data.error then
					dunstify("critical", "Direnv: error", data.errmsg)
				else
					dunstify(nil, "Direnv: Success", string.format("Loaded \"%s\" direnv", data.path))
				end
			end
		})
	end
}
