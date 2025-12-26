return {
    'stevearc/oil.nvim',
    dependencies = { "echasnovski/mini.icons", opts = {}},
    lazy = false,
    opts = {
        default_file_explorer = true,
        skip_confirm_for_simple_edits = true,	
        watch_for_changes = true,
        view_options = {
            show_hidden = false,
        },
        constraint_cursor = "name",
        preview_split = "right",
        columns = {
            "icon",
            "permissions",
            "size",
            "mtime",
        },
        use_default_keymaps = false;
        keymaps = {
            ["g?"] = { "actions.show_help", mode = "n" },
            ["<CR>"] = "actions.select",
            ["<C-s>"] = { "actions.select", opts = { vertical = true } },
            ["<C-h>"] = { "actions.select", opts = { vertical = true } },
            ["<localleader>s"] = "actions.preview",
            ["<C-y>"] = "actions.yank_entry",
            ["<localleader>q"] = { "actions.close", mode = "n" },
            ["<C-l>"] = "actions.refresh",
            ["<localleader>w"] =  {
                function()
                    local oil = require('oil')
                    local cwd =  { 
                        path = oil.get_current_dir(),
                        display = oil.get_current_dir(),
                    }

                    require('whaler').switch(cwd.path, cwd.display)

                    require('oil.actions').cd.callback("win",true)
                end,
                mode = "n",
                desc = "Sets the current whaler project to current directory"
            },
            ["-"] = { "actions.parent", mode = "n" },
            ["_"] = { "actions.open_cwd", mode = "n" },
            ["<localleader>d"] = { "actions.open_cwd", mode = "n" },
            ["`"] = { "actions.cd", mode = "n" },
            ["gs"] = { "actions.change_sort", mode = "n" },
            ["gx"] = "actions.open_external",
            ["g."] = { "actions.toggle_hidden", mode = "n" },
        },
    },
}
