return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    priority = 1000,
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {"c", "lua", "vim", "vimdoc", "query" },
            sync_install = false,
            highlight = { enable = true},
            indent = { enable = true },
        })
    end,
}
