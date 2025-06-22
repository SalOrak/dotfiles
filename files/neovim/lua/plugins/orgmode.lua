return {
	'nvim-orgmode/orgmode',
	config = function()
		require('orgmode').setup({
			org_agenda_files = "~/personal/orgvim",
			org_default_notes_file= "~/personal/orgvim/refile.org",
			mappings = {
				disable_all = true,
			},
		})
	end,

}
