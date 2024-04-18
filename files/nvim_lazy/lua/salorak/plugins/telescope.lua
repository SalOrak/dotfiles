return {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    priority = 1000,
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
        }, "nvim-tree/nvim-web-devicons",
        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
        },
        {
            "SalOrak/whaler",
            branch = "#20-feat-add-link-directories"
            -- dir = "/home/user/programming/whaler.nvim",
            -- enabled = true,
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
                        { path = "~/personal/", alias = "personal" },
                        { path = "/home/user/hacking/", alias = "hacking" },
                        { path = "/home/user/programming/", alias = "programming" }
                    },
                    oneoff_directories =  {
                        {},
                    },
                    auto_file_explorer = true,
                    auto_cwd = true,
                    links= true,
                    file_explorer= "oil",
                    theme = {
                        previewer = false,
                        layout_config = {
                            height = 0.2,
                            width = 0.2,
                        },
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

        keymap.set("n", "<leader>ww", telescope.extensions.whaler.whaler, {desc = "[W]haler"})
        keymap.set("n", "<leader>wn", function()
            local w = telescope.extensions.whaler.whaler
            w({
                auto_file_explorer = true,
                auto_cwd = false,
                file_explorer_config = {
                    plugin_name = "telescope",
                    command = "Telescope find_files",
                    prefix_dir = " cwd=",
                },
                theme = {
                    previewer = false,
                    layout_config = {
                        height = 0.7,
                        width = 0.7,
                    },
                    layout_strategy = "center",
                },
            })
        end, {desc = "[W]haler no auto_cwd"})

        keymap.set("n", "<leader>wr", function()
            local w = telescope.extensions.whaler.whaler
            w({
                auto_file_explorer = false,
                auto_cwd = false,
                file_explorer_config = {
                    plugin_name = "telescope",
                    command = "Telescope find_files",
                    prefix_dir = " cwd=",
                },
                theme = {
                    results_title = "Tet",
                    previewer = false,
                    layout_strategy = "center",
                    layout_config = {
                        height = 0.7,
                        width = 0.7,
                    },
                },
            })
        end, {desc = "[W]haler no auto_cwd"})

    end,
}
