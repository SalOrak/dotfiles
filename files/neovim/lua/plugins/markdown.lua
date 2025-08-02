return {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    opts = {
        -- configuration here or empty for defaults
        on_attach = function()
            local map = vim.keymap.set
            local opts = {buffer = bufnr}
            map({'n'}, '<localleader>t', function() 
                local cmd = vim.api.nvim_parse_cmd("MDToc", {})
                vim.api.nvim_cmd(cmd, {})
            end)
            map({'n'}, '<localleader>T', function() 
                local cmd = vim.api.nvim_parse_cmd("MDTocAll", {})
                vim.api.nvim_cmd(cmd, {})
            end)
            map({'n'}, '<localleader>i', function() 
                -- Save current cursor position
                local curr_pos = vim.api.nvim_win_get_cursor(0)

                -- Move to the beginning of the file
                vim.api.nvim_win_set_cursor(0, {1,0})

                -- Insert the TOC
                local cmd = vim.api.nvim_parse_cmd("MDInsertToc", {})
                vim.api.nvim_cmd(cmd, {})

                -- Insert new line
                vim.api.nvim_buf_set_lines(0,0,0,false, {""})

                -- Return to the cursor position
                vim.api.nvim_win_set_cursor(0, curr_pos)
            end)

            map({'n'}, '<localleader>j', function() 
                -- List item below
                local cmd = vim.api.nvim_parse_cmd("MDListItemBelow", {})
                vim.api.nvim_cmd(cmd, {})
            end)
            map({'n'}, '<localleader>k', function() 
                -- List item below
                local cmd = vim.api.nvim_parse_cmd("MDListItemAbove", {})
                vim.api.nvim_cmd(cmd, {})
            end)
            map({'n'}, '<localleader>l', function() 
                -- Task toggle
                local cmd = vim.api.nvim_parse_cmd("MDTaskToggle", {})
                vim.api.nvim_cmd(cmd, {})
            end)
        end,
    }
}
