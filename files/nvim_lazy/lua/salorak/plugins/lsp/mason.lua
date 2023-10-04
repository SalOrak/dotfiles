return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        local mason = require("mason")
        local mason_lsp= require("mason-lspconfig")
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
        mason_lsp.setup({
            ensure_installed = {
                "gopls", -- Go Official Language Server
                "lua_ls", -- Lua Language Server
            },
            automatic_installation = false,
        })

        local keymap = vim.keymap

        keymap.set("n", "<leader>M", "<cmd>Mason<CR>", { desc =  "Open Mason UI" })

    end,
}
