return {
	{
		dir = "/home/hector/personal/whaler.nvim",
		-- 'salorak/whaler.nvim',
		dependencies = {
            'nvim-telescope/telescope.nvim', 
            'nvim-lua/plenary.nvim',
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

        },
		config = function()
			local tele = require('telescope')
			local dirs = {
				{ path = "~/personal", alias = "Personal" },
				{ path = "~/work", alias = "Work" },
				{ path = "~/work/pedralbes/moduls/", alias = "Moduls" },
			}
			local static_dirs = {
				{ path = "~/personal/dotfiles/files/neovim", alias = "Config" },
				{ path = "~/personal/ziglings/exercises", alias = "Zig-Solutions" },
			} 
			tele.setup({
                defaults = {
                    sorting_strategy = "descending",
                },
				extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case"
                    },
					whaler = {
						directories = dirs,
						oneoff_directories = static_dirs,
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
			tele.load_extension("fzf")
			tele.load_extension("whaler")
		end
	},
}
