return {
    {
        -- Markdown previewer
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        config = function()
            vim.g.mkdp_filetypes = { "markdown" } 
        end,
    },
    {
        -- Markdown table formatting
        "godlygeek/tabular",
        init = function()
            local keymap = vim.keymap
            keymap.set('n', '<leader>tt', "<cmd>Tabularize /|<CR>") 
        end,
    },
}
