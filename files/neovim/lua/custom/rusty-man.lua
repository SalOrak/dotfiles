local rm_man_page = function(mod, data) 
    local is_scratch = true
    local in_buflist = true
    local bufname = "[Rustyman] - " .. mod
    local bufnr = vim.fn.bufnr(bufname) 
    if bufnr > 0 then
        -- there is a buffer with that exact name, let's delete it
        vim.api.nvim_buf_delete(bufnr, {force = true})
    end

    bufnr = vim.api.nvim_create_buf(in_buflist, is_scratch)
    vim.api.nvim_buf_set_name(bufnr, "[Rustyman] - " .. mod)
    vim.api.nvim_buf_set_lines(bufnr,0,-1,false, data)
    vim.api.nvim_win_set_buf(0, bufnr)
    vim.bo[bufnr].filetype = "rustyman"
    vim.bo[bufnr].readonly = true
    vim.bo[bufnr].modifiable = false

    -- Basic Rust syntax highlighting
    vim.cmd([[
        silent! syntax clear rustyman
        syntax include @rmrust syntax/rust.vim
        syntax region rmRust start="`" end="`" contains=@rmrust keepend
    ]])


    vim.keymap.set("n", "q", function()
        vim.cmd([[
            silent! syntax clear rustyman
        ]])
        vim.cmd("bprev")
    end, {desc = "Quit", buffer = bufnr})

end

local run_rustyman = function(mod)
    local l= {}
    local result = vim.system(
        {
            "rusty-man",
            "--viewer",
            "plain",
            "--source",
            "/home/hector/personal/whaler-rs/rust-docs-merged",
            mod }, {text = true}):wait()
    return result
end


local rustyman = function()
    vim.ui.input({
        prompt = "Rustyman >> ",
        default = "",
        completion = nil
    }, function(input)
        if input == "" then
            return 
        end
        local res = run_rustyman(input)
        if res.code ~= 0 then
            vim.notify(string.format("Rustyman: Module %s not found", input), vim.log.levels.WARN)
            return
        end

        local data = vim.fn.split(res.stdout, '\n')
        rm_man_page(input, data)
    end)
end

return rustyman
