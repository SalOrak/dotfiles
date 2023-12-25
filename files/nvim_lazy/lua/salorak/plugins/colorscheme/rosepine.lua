
return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    -- priority = 1000,
    opts = {
        variant = "main",
        dark_variant = "main",
        disable_background = true,
    },
    config = function(opts)
        require("rose-pine").setup(opts)
        vim.cmd[[colorscheme rose-pine]]

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
}
