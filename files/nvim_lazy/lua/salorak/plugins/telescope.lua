return {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    priority = 1000,
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        }, "nvim-tree/nvim-web-devicons",
        "ThePrimeagen/harpoon",
        {
            "SalOrak/whaler",
            --dir = "/home/user/personal/whaler.nvim",
            --enabled = true,
            --dev = true, -- Local development
        },
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
            },
            extensions = {
                whaler = {
                    directories = {
                        { path = "/home/user/personal/", alias = "personal" },
                        { path = "/home/user/hacking/", alias = "hacking" },
                        { path = "/home/user/programming/", alias = "programming" }
                    },
                    oneoff_directories =  {
                        { path = "/home/user/personal/dotfiles", alias = "dotfiles" },
                    },
                    auto_file_explorer = true,
                    auto_cwd = true,
                    file_explorer= "oil",
                    --[[
                    file_explorer_config = {
                        plugin_name = "telescope",
                        command = "Telescope file_browser",
                        prefix_dir = " path=",
                    },
                    --]]
                    theme = {
                        previewer = false,
                    },
                },
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("harpoon")
        telescope.load_extension("whaler")

        local keymap = vim.keymap
        local builtin = require('telescope.builtin')


        -- Telescope Keymaps
        keymap.set("n", "<leader>ff", builtin.find_files, {desc = "[F]ind [F]iles"})
        keymap.set("n", "<leader>fr", builtin.oldfiles, {desc = "[F]ind [R]ecent  files"})
        keymap.set("n", "<leader>ss", builtin.live_grep, {desc = "[F]ind [S]tring in your current working directory and get results live as you type, respects .gitignore"})
        keymap.set("n", "<leader>fg", builtin.git_files, {desc ="[F]ind [G]it ls-files"})
        keymap.set("n", "<leader>tm", builtin.man_pages, {desc = "[T]elescope [M]anpage entries"})
        keymap.set("n", "<leader>th", builtin.help_tags, {desc = "[T]elescope [H]elp tags"})
        keymap.set("n", "<leader>tk", builtin.keymaps, {desc = "[T]elescope [K]eymaps"})
        keymap.set("n", "<leader>tr", builtin.registers, {desc = "[T]elescope [R]egisters"})
        keymap.set("n", "<leader>tj", builtin.colorscheme, {desc = "[T]elescope Colorscheme"})

        -- Whaler  Keymap
        keymap.set("n", "<leader>ww",telescope.extensions.whaler.whaler, {desc = "[F]ind [W]haler. Directories as harpoon"})

    end,
}
