vim.g.mapleader = " "
vim.g.maplocalleader = ";"

local gh = require'salorak.pack'.gh

local plugins = {
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


-- Plugin installation
vim.pack.add({

	-- File explorer
	gh("stevearc/oil.nvim") ,
	gh("nvim-mini/mini.icons"),

	-- Project management
	gh("salorak/whaler.nvim"),

	-- Zettlekasten*
	gh("salorak/orak.nvim") ,

	-- Editing
	gh("kylechui/nvim-surround"), 
	gh("brenton-leighton/multiple-cursors.nvim"), 
	gh("stevearc/conform.nvim"), -- Autoformat

	-- Colorschemes
	gh("catppuccin/nvim"), 

	-- Completion
	gh("hrsh7th/nvim-cmp"),
	gh("hrsh7th/cmp-nvim-lua"),
	gh("hrsh7th/cmp-nvim-lsp"),
	gh("hrsh7th/cmp-nvim-lsp-signature-help"),
	gh("hrsh7th/cmp-path"),
	gh("hrsh7th/cmp-buffer"),
	gh("hrsh7th/cmp-cmdline"),

	-- Lsp
	gh("neovim/nvim-lspconfig"),

	-- Misc
	gh("salorak/nix-dev.nvim") ,
	gh("salorak/libtmux.nvim") ,

}, { confirm = true})


-- Plugin setup
