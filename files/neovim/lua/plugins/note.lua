return {
	dir = "/home/hector/personal/note.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	dev = true,
	config = function()
		local Note = require("note")

		local opts = {
			path = "~/personal/notes/zk",
		}

		Note.setup(opts)
	end,
}
