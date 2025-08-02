return {
    dir = "/home/hector/personal/ansible-doc.nvim",
    config = function()
        local k = vim.keymap.set
        local ansible = require'ansible-doc'
        k("n", "<leader>u", ansible.ansible_docs)
    end
}
