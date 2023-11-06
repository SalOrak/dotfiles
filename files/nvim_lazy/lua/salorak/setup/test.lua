local telescope= require('telescope')

P = function(d)
    local p = vim.inspect(d)
    print(p)
    return p
end


P(telescope.extensions)

