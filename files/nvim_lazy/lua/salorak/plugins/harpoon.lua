return {
    "ThePrimeagen/harpoon",
    name = "harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local keymap = vim.keymap

        local harpoon = require("harpoon")

        harpoon:setup()

        keymap.set("n", "<leader>a", function() harpoon:list():append() end, {desc = "Add file to Harpoon" })

        keymap.set("n", "<leader>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "Toggle Quick File Menu" })

        keymap.set("n", "<M-1>", function() harpoon:list():select(1) end, {desc = "Navigate to File 1" })
        keymap.set("n", "<M-2>", function() harpoon:list():select(2) end, {desc = "Navigate to File 2" })
        keymap.set("n", "<M-3>", function() harpoon:list():select(3) end, {desc = "Navigate to File 3" })
        keymap.set("n", "<M-4>", function() harpoon:list():select(4) end, {desc = "Navigate to File 4" })

    end,
}

