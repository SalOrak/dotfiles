return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()

        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap
        local opts = {noremap = true, silent = true}

        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            opts.desc = "Show LSP References"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- References through Telescope

            opts.desc = "Go to Declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- Definition and Reference

            opts.desc = "Show LSP Definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- Definitions through Telescope

            opts.desc = "Show LSP Implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- Implementations through Telescope

            opts.desc = "Show LSP Types"
            keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- Type definitions through Telescope

            opts.desc = "Smart Rename"
            keymap.set("n", "<leader>sr", vim.lsp.buf.rename , opts) -- Smart rename

            opts.desc = "Show Buffer Diagnostics"
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- Show diagnostics for current file

            opts.desc = "Show line Diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- Show diagnostics for current line

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- Go to previous diagnostic

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- Go to next diagnostic

            opts.desc = "Show documentation under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Show documentation for under cursor

            opts.desc = "Restart LSP Server"
            keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts) -- Restarts LSP Server
        end
        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        lspconfig["rust_analyzer"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["gopls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["bashls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })


        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    -- Recognize vim global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            -- Runtime awareness
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true
                        }
                    },
                }
            },
        })
    end,

}
