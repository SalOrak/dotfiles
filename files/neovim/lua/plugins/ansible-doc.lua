return {
    dir = "/home/hector/personal/ansible-doc.nvim",
    dependencies = { 
        "ibhagwan/fzf-lua",
        "echasnovski/mini.icons", 
        "rktjmp/lush.nvim" -- For automatic colorscheme generation
    },
    dev = true,
    opts = {
        cache_pages = false,
        docs_structure = {
            "author",
            "attributes",
            "notes",
            "options",
            "examples",
            "return",
        },
    }
}
