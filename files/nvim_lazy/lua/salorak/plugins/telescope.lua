return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim", build = "make"
        },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                    }
                }
            }
        })

        telescope.load_extension("fzf")
        telescope.load_extension("harpoon")

        local keymap = vim.keymap
        local builtin = require('telescope.builtin')

        keymap.set("n", "<leader>ff", builtin.find_files, {desc = "Fuzzy find files"})
        keymap.set("n", "<leader>fr", builtin.oldfiles, {desc = "Fuzzy find recent  files"})
        keymap.set("n", "<leader>fs", builtin.live_grep, {desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore"})
        keymap.set("n", "<leader>fg", builtin.git_files, {desc ="Fuzzy search through output of git ls-files"})
        keymap.set("n", "<leader>fm", builtin.man_pages, {desc = "List manpage entries"})
        keymap.set("n", "<leader>fh", builtin.help_tags, {desc = "List available help tags"})


    end,
}
