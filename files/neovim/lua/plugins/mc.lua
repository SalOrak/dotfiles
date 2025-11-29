return {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",  -- Use the latest tagged version
    opts = {},  -- This causes the plugin setup function to be called
    keys = {
        {"<M-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "x"}, desc = "Add cursor and move down"},
        {"<M-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "x"}, desc = "Add cursor and move up"},

        {"<M-J>", "<Cmd>MultipleCursorsAddMatches<CR>", mode = {"n", "x"}, desc = "Add cursors to cword"},
        {"<M-k>", "<Cmd>MultipleCursorsAddMatchesV<CR>", mode = {"n", "x"}, desc = "Add cursors to cword in previous area"},
    }

}
