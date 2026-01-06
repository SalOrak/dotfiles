return { 
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    opts = 
    {
        -- Disable all keymaps by setting mappings field to 'false'.
        -- Selectively disable keymaps by setting corresponding field to 'false'.
        mappings =  false,
        link = {
            paste = {
                enable = true, -- whether to convert URLs to links on paste
            },
        },
        toc = {
            -- Comment text to flag headings/sections for omission in table of contents.
            omit_heading = "toc omit heading",
            omit_section = "toc omit section",
            -- Cycling list markers to use in table of contents.
            -- Use '.' and ')' for ordered lists.
            markers = { "-" },
        },
        -- Hook functions allow for overriding or extending default behavior.
        -- Called with a table of options and a fallback function with default behavior.
        -- Signature: fun(opts: table, fallback: fun())
        hooks = {
            -- Called when following links. Provided the following options:
            -- * 'dest' (string): the link destination
            -- * 'use_default_app' (boolean|nil): whether to open the destination with default application
            --   (refer to documentation on <Plug> mappings for explanation of when this option is used)
            follow_link = nil,
        },
        on_attach = nil, -- (fun(bufnr: integer)) callback when plugin attaches to a buffer
    }
}
