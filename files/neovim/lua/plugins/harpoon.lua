return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    config = function()

        local harpoon = require "harpoon"

        local settings = {
            save_on_toggle = true,
            sync_on_ui_close = true,
        }

        harpoon:setup({settings = settings})

        vim.keymap.set("n", "<m-a>", function()
            harpoon:list():add()
        end)
        vim.keymap.set("n", "<m-q>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        for _, idx in ipairs { 1, 2, 3, 4} do
            vim.keymap.set("n", string.format("<m-%d>", idx), function()
                harpoon:list():select(idx)
            end)
        end
    end,
}
