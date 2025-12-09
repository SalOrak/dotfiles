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



--- Get the N directory names from a path
---@param path string String path
---@param ndirs number How many directories to include from the end
---@return result_path string Returns the last N directories. For example:
--- with PATH `/etc/udev/rules.d/` and N = 2, it returns `udev/rules.d/`
strip_path_from_end = function(path, ndirs)
    local result = ""
    local pattern = "(%w+)"

    if ndirs <= 0 then
        return result
    end

    local rev = string.reverse(path)
    local is_ok, finish, capture = string.find(rev, pattern, 1)
    while (is_ok ~= nil and ndirs > 0 ) do
        result = string.reverse(capture) .. '/' .. result
        is_ok, finish, capture = string.find(rev, pattern, finish + 1)
        ndirs = ndirs - 1
    end

    return string.sub(result, 1, #result  - 1)
end




