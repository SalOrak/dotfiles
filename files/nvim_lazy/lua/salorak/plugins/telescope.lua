return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 
            'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
        },
        "nvim-tree/nvim-web-devicons",
        "ThePrimeagen/harpoon",
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

        keymap.set("n", "<leader>ff", builtin.find_files, {desc = "[F]ind [F]iles"})
        keymap.set("n", "<leader>fr", builtin.oldfiles, {desc = "[F]ind [R]ecent  files"})
        keymap.set("n", "<leader>ss", builtin.live_grep, {desc = "[F]ind [S]tring in your current working directory and get results live as you type, respects .gitignore"})
        keymap.set("n", "<leader>fg", builtin.git_files, {desc ="[F]ind [G]it ls-files"})
        keymap.set("n", "<leader>lm", builtin.man_pages, {desc = "[L]ist [M]anpage entries"})
        keymap.set("n", "<leader>lh", builtin.help_tags, {desc = "[L]ist [H]elp tags"})


    end,
}
