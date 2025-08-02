
return {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
        -- add options here
        -- or leave it empty to use the default settings
    },
    keys = {
        -- suggested keymap
        { "<leader>i", "<cmd>PasteImage<cr>", desc = "paste image from system clipboard" },
        { "<leader>I", function() 
            local telescope = require("telescope.builtin")
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            telescope.find_files({
                search_file = "*.png",
                attach_mappings = function(_, map)
                    local function embed_image(prompt_bufnr)
                        local entry = action_state.get_selected_entry()
                        local filepath = entry[1]
                        actions.close(prompt_bufnr)

                        local img_clip = require("img-clip")
                        img_clip.paste_image(nil, filepath)
                    end

                    map("i", "<CR>", embed_image)
                    map("n", "<CR>", embed_image)

                    return true
                end,
            })
        end, desc = "paste image from system clipboard" },
        { "<leader>J", function() 
            local cmd = vim.api.nvim_parse_cmd("!grimshot copy area",{})
            cmd.mods.silent = true
            vim.api.nvim_cmd(cmd, {output = false})

            local img_clip = require("img-clip")
            img_clip.paste_image({relative_to_current_file = true, copy_images = true}) 
        end, desc = "Screenshot and paste image" },
    }
}

