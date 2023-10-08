--[[
-- Nvim-Tree
return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        local nvimtree = require("nvim-tree")
        nvimtree.setup({
            sync_root_with_cwd = true, -- RECOMMENDED Option
        })
    end,
    lazy = false,
    priority = 1000,
}
--]]


--[[ 
-- Neo-Tree
--- Works out of the box
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    priority = 1000,
}
--]]

return {
}
