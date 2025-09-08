return {
    "nvim-telekasten/telekasten.nvim",
    dependencies = {"nvim-telescope/telescope.nvim"},
    config = function()
        require'telekasten'.setup {
            home = vim.fn.expand("~/personal/notes"),
            dailies = vim.fn.expand("~/personal/notes/dailies"),
            templates = vim.fn.expand("~/personal/notes/templates"),
            img_subdir = "img",
            new_note_filename = "title",
            image_link_style = "markdown",
            vaults = {
                personal = {
                    home = vim.fn.expand("~/personal/notes"),
                    dailies = vim.fn.expand("~/personal/notes/dailies"),
                    templates = vim.fn.expand("~/personal/notes/templates"),
                },
                work = {
                    home = vim.fn.expand("~/work/notes"),
                    dailies = vim.fn.expand("~/work/notes/dailies"),
                    templates = vim.fn.expand("~/work/notes/templates"),
                }
            },
            journal_auto_open = true,
            clipboard_program = "wl-paste",
            filename_space_subst = "-",
            filename_small_case = true,
        }
    end
}
