local augroup_name_make = "salorak_make"

local group  =  vim.api.nvim_create_augroup( 
    augroup_name_make, {clear = true}
) 

vim.api.nvim_create_autocmd({'BufEnter'}, {
    group = group,
    pattern = { '*.c', '*.h', '*.zig'},
    callback = function(ev)
        local ext = vim.fn.tolower(vim.fn.fnamemodify(ev.file, ":e")) 
        local cwd, _= require('telescope').extensions.whaler.get_current_project()
        if ext == "c" or ext == "h" then
            vim.fn.mkdir(cwd .. "/build", "p")
            vim.opt.makeprg = "gcc % -o " .. cwd .. "/build/main"
        elseif ext == "zig" then
            vim.opt.makeprg = "zig build"
        end
    end
})

