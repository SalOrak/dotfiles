return {
    "hrsh7th/nvim-cmp",
    lazy = false,
    enabled = true,
    priority = 100,
    dependencies = {
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
    },

    config = function()
        vim.opt.completeopt = { "menu", "noselect", "preview" }
        vim.opt.shortmess:append("c")

        local cmp = require("cmp")

        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                end
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp", priority = 1000},
                { name = "nvim_lsp_signature_help", priority = 800}, 
                { 
                    name = "buffer", 
                    option = {
                        --- Only use in the current buffer.
                        get_bufnrs = function()
                            return { vim.api.nvim_get_current_buf()}
                        end
                    },
					priority = 800,
                },
                { 
                    name = "path", 
                    option = {
                        --- Only use in the current buffer.
                        get_bufnrs = function()
                            return { vim.api.nvim_get_current_buf()}
                        end
                    },
					priority = 800,
                },
            }),
            mapping = {
                ["<C-j>"] = cmp.mapping.scroll_docs(-4),
                ["<C-k>"] = cmp.mapping.scroll_docs(4),
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-y>"] = cmp.mapping(
                    cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    }),
                    { "i", "c" }
                ),
            },

            sorting = {
                priority_weight = 1.0,
                comparators = {
                    -- Below is the default comparitor list and order for nvim-cmp
                    cmp.config.compare.exact,
                    cmp.config.compare.locality,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.score,
                    -- cmp.config.compare.kind,
                    cmp.config.compare.length,
                    cmp.config.compare.offset,
                    cmp.config.compare.order,
                    -- cmp.config.compare.sort_text,
                },
            },
        })

        cmp.setup.filetype("lua", {
            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-y>"] = cmp.mapping(
                    cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    }),
                    { "i", "c"}
                ),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp", priority = 900},
                { name = "nvim_lsp_signature_help"},
                { name = "nvim_lua", priority = 1000},
            })
        })

        cmp.setup.filetype("vim", {
            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-y>"] = cmp.mapping(
                    cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    }),
                    { "i", "c"}
                ),
            },
            sources = cmp.config.sources({
                { name = "cmdline"},
            })
        })

        cmp.setup.cmdline(":", {
            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-y>"] = cmp.mapping(
                    cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    }),
                    { "i", "c"}
                ),
            },
            sources = cmp.config.sources({
                { name = "cmdline"},
            })
        })
    end,
}
