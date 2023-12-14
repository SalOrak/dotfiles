return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-neorg/neorg-telescope"
    },
    config = function()
        local neorg = require("neorg")
        neorg.setup{
            load = {
                ["core.defaults"] = {},
                ["core.esupports.hop"] = {
                    config = {
                        external_filetypes = "pdf",
                    },
                },
                ["core.summary"] = {},
                ["core.concealer"] = {},
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp"
                    }
                },
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "/home/user/notes",           -- General Notes
                            zt = "/home/user/notes/zettlekasten", -- Personal Development
                            hack = "/home/user/notes/hacking",    -- Hacking related (machines, tricks, tools, etc)
                            prog = "/home/user/notes/programming", -- Programming related --> The art of programming.
                        },
                        default_workspace = "notes",
                        index = "index.norg",
                    }
                },
                ["core.export"] = {
                    config = {
                        export_dir = "<export-dir>/<language>-export"
                    }
                },
                ["core.integrations.telescope"] = {
                },
                ["core.keybinds"] = {
                    config = {
                        neorg_leader = " ",
                        hook = function(keybinds)
                            local l = keybinds.leader

                            -- Remapping for convinience
                            keybinds.remap_key("norg", "n", l .. "th", l .. "tw" )

                            -- List toggle to enumeration toggle 
                            keybinds.remap_key("norg", "n", l .. "lt", l .. "et")

                            -- Unmap inverted toggle list.
                            keybinds.unmap("norg", "n", l .. "li")

                            -- Map Neorg Return
                            keybinds.map("norg","n", l .. "nr", ":Neorg return<CR>" )

                            -- Map Neorg index
                            keybinds.map("norg","n", l .. "ni", ":Neorg index<CR>" )
                            keybinds.map("norg","n", "<M-o>", "<cmd>Neorg keybind norg core.itero.next-iteration<CR>" )

                            -- Map generate workspace summary
                            keybinds.map("norg","n", l .. "gs", ":Neorg generate-workspace-summary<CR>" )

                            -- Metadata (inject and update)
                            keybinds.map("norg","n", l .. "mi", ":Neorg inject-metadata<CR>" )
                            keybinds.map("norg","n", l .. "mu", ":Neorg update-metadata<CR>" )

                            -- Neorg-Telescope
                            --- Find files
                            keybinds.map("norg","n", l .. "ff", ":Telescope neorg find_norg_files<CR>" )
                            --- Find by headers 
                            keybinds.map("norg","n", l .. "fh", ":Telescope neorg search_headings<CR>" )
                            --- Insert file 
                            keybinds.map("norg","n", l .. "fi", ":Telescope neorg insert_file_link<CR>" )
                            --- Paste file with headers
                            keybinds.map("norg","n", l .. "fl", ":Telescope neorg insert_link<CR>" )

                        end,
                    }
                },
            }
        }
        local keymap = vim.keymap

        keymap.set("n", "<leader>nn", ":Neorg workspace notes<CR>", { desc = "Neorg general notes workspace"} )
        keymap.set("n", "<leader>nz", ":Neorg workspace zt<CR>", { desc = "Neorg personal develpment (zettlekasten) workspace"} )
        keymap.set("n", "<leader>nh", ":Neorg workspace hack<CR>", { desc = "Neorg hacking workspace"} )
        keymap.set("n", "<leader>np", ":Neorg workspace prog<CR>", { desc = "Neorg programming workspace"} )
        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
    end,
}
