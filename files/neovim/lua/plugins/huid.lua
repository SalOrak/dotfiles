return {
	dir = "/home/hector/personal/huid.nvim",
	dependencies = {
	},
	dev = true,
	config = function()
		local huid = require("huid")

		huid.setup({})
	end,
}
