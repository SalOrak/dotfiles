local k = vim.keymap

local opts = function(desc) return { buffer = bufnr, desc = desc} end

if pcall(require, 'telekasten') then
    local tk = require'telekasten'
    k.set({"n", "v"}, "<localleader>i", tk.insert_link, opts("Kasten: Insert Link"))
    k.set({"n", "v"}, "<localleader>f", tk.follow_link, opts("Kasten: Follow Link"))
    k.set({"n", "v"}, "<localleader>r", tk.rename_note, opts("Kasten: Rename note"))
    k.set({"n", "v"}, "<localleader>q", tk.toggle_todo, opts("Kasten: Toggle todo"))
    k.set({"n", "v"}, "<localleader>b", tk.show_backlinks, opts("Kasten: Show backlinks"))
end

k.set({"n", "v"}, "<localleader>d", function() 
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))  -- Get the current cursor position
    local date = os.date("%d %B %Y")
    vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, {date})
end,opts("Insert date"))



