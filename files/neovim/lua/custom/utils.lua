-- Pretty print
P = function(val)
    print(vim.inspect(val))
    return val
end

-- Pretty error I guess
E = function(val)
    require('plenary.log').error(vim.inspect(val))
    return val
end


