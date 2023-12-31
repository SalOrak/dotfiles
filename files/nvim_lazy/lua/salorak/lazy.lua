-- folke/Lazy Package manager installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    {import = "salorak.plugins"},
    {import = "salorak.plugins.lsp"},
    {import = "salorak.plugins.colorscheme"}
},
{
    install = {
        colorscheme = {"kanagawa"},
    },
    change_detection = {
        notify = false,
    },

})
