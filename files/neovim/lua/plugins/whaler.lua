return {
    {
        dir = "/home/hector/personal/whaler.nvim",
        -- "salorak/whaler.nvim",
        -- branch = "fzf_explore",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        lazy = false,
        config = function()
            local w = require'whaler'
			local dirs = {
				{ path = "~/personal", alias = "Personal" },
				{ path = "~/work", alias = "Work" },
				{ path = "~/work/proven/moduls/", alias = "Moduls" },
				{ path = "~/personal/microbit/discovery-mb2/mdbook/src/", alias = "MicroBit" },
				{ path = "~/personal/rusty-patterns", alias = "Pattern" },
			}
			local static_dirs = {
				{ path = "~/personal/dotfiles/files/neovim", alias = "Config" },
				{ path = "~/personal/notes/personal-curriculums/2025", alias = "PC" },
				{ path = "~/personal/ziglings/exercises", alias = "Zig-Solutions" },
				{ path = "~/drive/personal/dev/", alias = "Drive-Personal" },
				{ path = "~/drive/work/proven/", alias = "Drive-Work" },
			}

            w.setup({
                directories = dirs,
                oneoff_directories = static_dirs,
                file_explorer = "oil",
				hidden = false,
                picker = "telescope",
                theme = {
                    layout_config = {
                        height = 0.5,
                        width = 0.6,
                    },
                },
            })


            -- After switching, get the markers and modify the nvim
            -- enviornment accordingly
            local augroup = vim.api.nvim_create_augroup('whalermarkers', {clear =true})

            vim.api.nvim_create_autocmd('User', {
                pattern = "WhalerPostSwitch",
                callback = function(ev)
                    local path = ev.data.path
                    if path == nil then
                        return
                    end

                    local get_markers = require'custom.whaler-markers'.get_markers
                    local markers = get_markers(path)

                    if vim.list_contains(markers, "direnv") then
						local nixdev = require'nix-dev'
						nixdev.nix_develop()
                    end

                    if vim.list_contains(markers, "rust") then
                        vim.opt.makeprg = "cargo"
                    elseif vim.list_contains(markers, "zig") then
                        vim.opt.makeprg = "zig"
                    else 
                        vim.opt.makeprg = "make"
                    end
                end
            })

        end,
    },
}
