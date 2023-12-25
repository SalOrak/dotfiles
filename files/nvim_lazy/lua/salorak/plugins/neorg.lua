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
                ["core.concealer"] = {
                    config = {
                        icon_preset = "basic"
                    }
                },
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp"
                    }
                },
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            zt = "/home/user/notes/zettlekasten", -- Personal Development
                            wiki = "/home/user/notes/wiki", -- Wiki Workspace
                        },
                        default_workspace = "zt",
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
                            keybinds.map("norg", "n", l .. "nr", ":Neorg return<CR>" )

                            -- Map Neorg index
                            keybinds.map("norg", "n", l .. "ni", ":Neorg index<CR>" )
                            keybinds.map("norg", "n", "<M-o>", "<cmd>Neorg keybind norg core.itero.next-iteration<CR>" )

                            -- Metadata (inject and update)
                            keybinds.map("norg", "n", l .. "mi", ":Neorg inject-metadata<CR>" )
                            keybinds.map("norg", "n", l .. "mu", ":Neorg update-metadata<CR>" )

                            -- Neorg-Telescope
                            --- Find files
                            keybinds.map("norg", "n", l .. "ff", ":Telescope neorg find_norg_files<CR>" )
                            --- Find by headers 
                            keybinds.map("norg", "n", l .. "fh", ":Telescope neorg search_headings<CR>" )
                            --- Insert file 
                            keybinds.map("norg", "n", l .. "fi", ":Telescope neorg insert_file_link<CR>" )
                            --- Paste file with headers
                            keybinds.map("norg", "n", l .. "fl", ":Telescope neorg insert_link<CR>" )

                            -- Generate summary automagically
                            keybinds.map("norg", "n", "<leader>gs", function()
                                local bufname = vim.api.nvim_buf_get_name(0)
                                if not string.find(bufname, "index.norg") then
                                    vim.cmd("Neorg index")
                                end
                                vim.cmd("norm ggdGi* Summary")
                                vim.cmd("Neorg inject-metadata")
                                vim.cmd("Neorg generate-workspace-summary")
                            end)
                        end,
                    }
                },
            }
        }
        local keymap = vim.keymap


        -- Create new note from outside neorg directly.
        keymap.set("n", "<leader>nn",
            function()
                -- vim.cmd[[Neorg workspace]] -- Go to default workspace
                vim.cmd("Neorg keybind norg core.dirman.new.note")
            end,
            { desc = "[N]eorg create [N]ote"}
        )
        -- Change Workspaces
        keymap.set("n", "<leader>nh", ":Neorg workspace zt<CR>", { desc = "[N]eorg [H]ettlekasten workspace"} )
        keymap.set("n", "<leader>nu", ":Neorg workspace wiki<CR>", { desc = "[N]eorg [U]iki workspace"} )


        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
    end,
}
