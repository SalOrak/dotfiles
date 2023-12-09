
local api = vim.api


-- Split vertically by default using autocommands
local salorakGroup = api.nvim_create_augroup('salorakWindows', {clear = true})

api.nvim_create_autocmd(
    {'WinNew'},
    {
        pattern = '*',
        group = 'salorakWindows',
        command = 'wincmd L',
    }
)





