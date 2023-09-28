local pickers = require("telescope.pickers")
local previewers = require("telescope.previewers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values


local fn = vim.fn
local homedir = vim.loop.os_homedir() .. "/"
local ins = vim.inspect

local get_subdir = function(dir)
    dir = homedir .. dir

    if dir == nil then
        print('Directory is nil')
        return
    end

    if fn.isdirectory(dir) == 0 then
        print('Directory '.. dir.. ' is not a real directory')
        return
    end

    local tbl_dir = {}
    local idx = 1

    for k,v in ipairs(fn.readdir(dir)) do
        local entry = dir .. "/" .. v
        if fn.isdirectory(entry) == 1 then
            tbl_dir[idx] = entry
            idx = idx + 1
        end
    end

    return tbl_dir
end

local get_entries = function(tbl_dir)
    tbl_dir = tbl_dir or {}
    if tbl_dir == nil then
        print("Table must contain valid directories")
        return
    end

    local tbl_entries = {}
    local idx = 1 -- Tables start at 1
    for _,v1 in ipairs(tbl_dir) do
        local subdir = get_subdir(v1)
        for _,v2 in ipairs(subdir) do
            tbl_entries[idx] = v2
            idx = idx + 1
        end
    end

    return tbl_entries
end


local dirs = { ".config", "work", "personal"}

local directory_picker = function(opts, dirs)
    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "Fuzzy Find directories",
        finder = finders.new_table{
            results = dirs
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                -- Change current directory
                vim.api.nvim_set_current_dir(selection[1])
                -- Command to open netrw
                local cmd = vim.api.nvim_parse_cmd("Explore" .. selection[1],{})
                -- Execute command
                vim.api.nvim_cmd(cmd, {})
            end)
            return true
        end
    }):find()
end

directory_picker(conf, get_entries(dirs))
