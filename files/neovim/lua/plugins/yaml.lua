return {
    "cuducos/yaml.nvim",
    ft = { "yaml" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "ibhagwan/fzf-lua",
    },
    config = function()
        local k = vim.keymap.set
        k({'n'}, "<localleader>q", "<cmd>YAMLQuickfix<CR>")
        k({'n'}, "<localleader>f", "<cmd>YAMLFzfLua<CR>")
    end,
}
