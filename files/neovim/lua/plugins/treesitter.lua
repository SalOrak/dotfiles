return {
	"nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ':TSUpdate',
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			ensure_installed = {
				"c",
				"java",
				"bash",
				"lua",
				"zig",
				"rust",
				"python",
				"vim",
				"vimdoc",
				"markdown",
				"markdown_inline",
				"query",
				"yaml",
				"toml",
				"ini",
				"nix",
				"dockerfile",
				"sway",
				"terraform",
				"udev",
			},
			sync_install = true,
			auto_install = true,
			highlight = {
				enable = true,
			},
		})
	end,
}
