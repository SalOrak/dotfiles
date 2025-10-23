return {
	"nvim-telekasten/telekasten.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-telescope/telescope-media-files.nvim" },
	config = function()
		local personal_dir = "~/personal/notes"
		local work_dir = "~/work/proven/notes"

		require("telekasten").setup({
			home = vim.fn.expand(personal_dir),
			dailies = vim.fn.expand(personal_dir .. "/dailies"),
			templates = vim.fn.expand(personal_dir .. "/templates"),
			img_subdir = "img",
			new_note_filename = "title",
			image_link_style = "markdown",
			media_previewer = "telescope-media-files",
			media_extensions = {
				".png",
				".jpg",
				".webp",
			},
			vaults = {
				personal = {
					home = vim.fn.expand(personal_dir),
					dailies = vim.fn.expand(personal_dir .. "/dailies"),
					templates = vim.fn.expand(personal_dir .. "/templates"),
				},
				work = {
					home = vim.fn.expand(work_dir),
					dailies = vim.fn.expand(work_dir .. "/dailies"),
					templates = vim.fn.expand(work_dir .. "/templates"),
				},
			},
			journal_auto_open = true,
			clipboard_program = "wl-paste",
			filename_space_subst = "-",
			filename_small_case = true,
		})
	end,
}
