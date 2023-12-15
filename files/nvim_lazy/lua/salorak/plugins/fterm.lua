return {
    "numToStr/FTerm.nvim",
    config = function ()
        local fterm = require("FTerm")
        fterm.setup({})

        local keymaps = vim.keymap

        keymaps.set("n", "<leader>ft", function()
            fterm.toggle()
        end)

        keymaps.set("t", "<A-f>", function()
            fterm.toggle()
        end)
    end
}
