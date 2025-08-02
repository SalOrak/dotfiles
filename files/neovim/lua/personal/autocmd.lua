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

vim.g.autorun= false
-- Execute last command on save
vim.keymap.set({"n"}, "<leader>S", function()
    vim.g.autorun = not vim.g.autorun
end)

vim.api.nvim_create_autocmd({'BufWritePost'}, {
    group = autogroup,
    pattern = "*",
    callback = function()
        if vim.g.autorun then
            vim.api.nvim_cmd(vim.api.nvim_parse_cmd("VimuxRunLastCommand", {}), {})
        end
    end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = autogroup,
    callback = function()
        vim.hl.on_yank()
    end
})


