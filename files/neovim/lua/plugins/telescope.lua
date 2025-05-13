return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {'nvim-lua/plenary.nvim'},
	},
	{
		'salorak/whaler.nvim',
		dependencies = {'nvim-telescope/telescope.nvim'},
		config = function()
			local tele = require('telescope')
			local dirs = {
				{ path = "~/personal", alias = "Personal" },
				{ path = "~/work", alias = "Work" },
				{ path = "~/work/pedralbes/moduls/", alias = "Moduls" },
			}
			tele.setup({
				extensions = {
					whaler = {
						directories = dirs,
						file_explorer = "oil",
						theme = {
							layout_config = {
								height = 0.5,
								width = 0.6,
							}
						}
					}
				}
			})
			tele.load_extension("whaler")
		end
	},
}
