local augroup_name = "salorak"

-- Autogroup
local autogroup = vim.api.nvim_create_augroup(
    augroup_name, 
    {clear = true}
)


-- Terminal mode always in insert mode.
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
    group = autogroup,
    pattern = "*",
    command = ":norm i"
})


vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = autogroup,
    callback = function()
        vim.hl.on_yank()
    end
})


