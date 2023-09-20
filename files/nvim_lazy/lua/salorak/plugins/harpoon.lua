return {
    "ThePrimeagen/harpoon",
    name = "harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        global_settings = {
            enter_on_sendcmd = true,
        },
    },
    config = function(_, opts)
        require('harpoon').setup(opts)
        local keymap = vim.keymap

        local mark = require('harpoon.mark')
        local ui = require('harpoon.ui')

        keymap.set("n", "<leader>m", function() ui.toggle_quick_menu() end, {desc = "Toggle Quick File Menu" })
        keymap.set("n", "<leader>a", function() mark.add_file() end, {desc = "Add file to Harpoon" })
        keymap.set("n", "<M-1>", function() ui.nav_file(1) end, {desc = "Navigate to File 1" })
        keymap.set("n", "<M-2>", function() ui.nav_file(2) end, {desc = "Navigate to File 2" })
        keymap.set("n", "<M-3>", function() ui.nav_file(3) end, {desc = "Navigate to File 3" })
        keymap.set("n", "<M-4>", function() ui.nav_file(4) end, {desc = "Navigate to File 4" })

        local tmux = require('harpoon.tmux')
        local tui= require('harpoon.cmd-ui')

        keymap.set("n", "<leader>cc", function() tui.toggle_quick_menu() end, {desc="Toggle Quick Command Menu"})
        keymap.set("n", "<leader>c1", function() tmux.sendCommand("{right}", 1) end, {desc = "Send to rightmost pane command 1" })
        keymap.set("n", "<leader>c2", function() tmux.sendCommand("{right}", 2) end, {desc = "Send to rightmost pane command 2" })
        keymap.set("n", "<leader>c3", function() tmux.sendCommand("{right}", 3) end, {desc = "Send to rightmost pane command 3" })
        keymap.set("n", "<leader>c4", function() tmux.sendCommand("{right}", 4) end, {desc = "Send to rightmost pane command 4" })



    end,
}

