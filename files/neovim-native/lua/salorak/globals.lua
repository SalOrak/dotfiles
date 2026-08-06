local M = {}

M.plugins = {
	file_explorer = {
		"stevearc/oil.nvim",
		"nvim-mini/mini.icons",
	},

	project_management = {
		"salorak/whaler.nvim"
	},

	zettlekasten = {
		"salorak/orak.nvim"
	},

	editing = {
		"kylechui/nvim-surround", 
		"brenton-leighton/multiple-cursors.nvim", 
		"stevearc/conform.nvim", -- Autoformat
	},

	colorschemes = {
		"catppuccin/nvim", 
	},

	completion = {
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
	},

	lsp = {
		-- Lsp
		"neovim/nvim-lspconfig",
	},

	misc = {
		-- Misc
		"salorak/nix-dev.nvim" ,
		"salorak/libtmux.nvim" ,
	},
}

M._keymaps = {}

M.set_key("<leader>aB")



return M
