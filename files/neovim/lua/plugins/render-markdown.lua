return {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
        local g = vim.g
        g.mkdp_auto_start = 0 
        g.mkdp_auto_close = 0 
        g.mkdp_refresh_slow = 1
        g.mkdp_command_for_global = 1
        g.mkdp_open_to_the_world = 1
        g.mkdp_port = 13013
    end,
}
