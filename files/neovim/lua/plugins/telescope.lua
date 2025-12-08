return {
	{
		dir = "/home/hector/personal/whaler.nvim",
		-- 'salorak/whaler.nvim',
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local tele = require("telescope")
			local a = require("telescope.actions")
			local dirs = {
				{ path = "~/personal", alias = "Personal" },
				{ path = "~/work", alias = "Work" },
				{ path = "~/work/proven/moduls/", alias = "Moduls" },
				{ path = "~/personal/microbit/discovery-mb2/mdbook/src/", alias = "MicroBit" },
			}
			local static_dirs = {
				{ path = "~/personal/dotfiles/files/neovim", alias = "Config" },
				{ path = "~/personal/notes/personal-curriculums/2025", alias = "PC" },
				{ path = "~/personal/ziglings/exercises", alias = "Zig-Solutions" },
				{ path = "~/drive/personal/dev/", alias = "Drive-Personal" },
				{ path = "~/drive/work/proven/", alias = "Drive-Work" },
			}
			tele.setup({
				defaults = {
					mappings = {
						n = {
							["<C-q>"] = false,
							["<C-t>"] = false,
							["<leader>q"] = a.send_to_qflist + a.open_qflist,
						},
					},
					sorting_strategy = "descending",
					path_display = {
						"truncate",
						"filename_first",
					},
					border = true,
					-- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					borderchars = { "", "", "", "", "", "", "", "" },
					color_devicons = true,
				},
				pickers = {
					find_files = {
						layout_strategy = "horizontal",
						layout_config = {
							height = 0.99,
							width = 0.99,
							prompt_position = "top",
							preview_cutoff = 120,
							preview_width = 0.4,
						},
						sorting_strategy = "ascending",
					},
				},
				extensions = {
					fzf = {
						fuzzy = false,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					whaler = {
						directories = dirs,
						oneoff_directories = static_dirs,
						file_explorer = "oil",
						theme = {
							layout_config = {
								height = 0.5,
								width = 0.6,
							},
						},
					},
				},
			})
			tele.load_extension("fzf")
			tele.load_extension("whaler")
		end,
	},
}
