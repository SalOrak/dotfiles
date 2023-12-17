
return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        local neogit = require("neogit")
        neogit.setup({})

        local k = vim.keymap
        k.set("n", "<leader>gg", "<cmd>Neogit <CR>",{ desc = "Open Neo[G]it default window" })
        k.set("n", "<leader>gw", "<cmd>Neogit cwd=~/notes<CR>",{ desc = "Open Neo[G]it in Personal [W]iki" })


    end,
}
