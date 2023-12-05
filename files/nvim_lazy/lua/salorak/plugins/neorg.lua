return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
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
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "/home/user/notes",
                            hack = "/home/user/notes/hacking",
                            prog = "/home/user/notes/programming",
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
            }
        }
        local keymap = vim.keymap

        keymap.set("n", "<leader>nn", ":Neorg workspace notes<CR>", { desc = "Neorg General notes"} )
        keymap.set("n", "<leader>nh", ":Neorg workspace hack<CR>", { desc = "Neorg Hacking notes"} )
        keymap.set("n", "<leader>np", ":Neorg workspace prog<CR>", { desc = "Neorg Programming notes"} )
    end,
}
