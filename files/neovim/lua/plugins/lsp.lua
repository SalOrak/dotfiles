return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		"nvim-telescope/telescope.nvim",

		-- Java capabilities
		"mfussenegger/nvim-jdtls",

		-- Extra capabilities provided by blink.cmp
		-- 'saghen/blink.cmp'
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("salorak-lsp-attach", { clear = true }),
			callback = function(event)
				vim.keymap.set(
					{ "n", "v" },
					"gd",
					"<cmd>Telescope lsp_definitions<CR>",
					{ buffer = event.buf, desc = "LSP: Goto Definitions" }
				)
				vim.keymap.set({ "n", "v" }, "gD", vim.lsp.buf.declaration, { buffer = 0, desc = "LSP: Declarations" })
				vim.keymap.set(
					{ "n", "v" },
					"gs",
					"<cmd>Telescope lsp_document_symbols<CR>",
					{ buffer = event.buf, desc = "LSP: Open document symbols" }
				)

				vim.keymap.set({ "n", "v" }, "<leader>cr", vim.lsp.buf.rename, { buffer = 0, desc = "LSP: Var Rename" })
				vim.keymap.set({ "n", "v" }, "<leader>k", vim.lsp.buf.hover, { buffer = 0, desc = "LSP: Hover" })
				vim.keymap.set(
					{ "n", "v" },
					"<leader>K",
					vim.lsp.buf.signature_help,
					{ buffer = 0, desc = "LSP: Signature help" }
				)
				vim.keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.add_workspace_folder,
					{ buffer = 0, desc = "LSP: Add workspace folder" }
				)

				vim.api.nvim_create_autocmd("LspDetach", {
					group = vim.api.nvim_create_augroup("salorak-lsp-detach", { clear = true }),
					callback = function(event2)
						vim.lsp.buf.clear_references()
					end,
				})
			end,
		})

		vim.diagnostic.config({
			underline = false,
			signs = false,
			virtual_lines = false,
			virtual_text = false,
		})

		local lsp_servers = {
			lua_ls = {},
			stylua = {},
			jdtls = {},
			zls = {},
		}

		local ensure_installed = vim.tbl_keys(lsp_servers or {})

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			ensure_installed = {},
			automatic_installation = false,
		})

		-- Extend capabilities
		local capabilities = nil
		if pcall(require, "cmp_nvim_lsp") then
			capabilities = require("cmp_nvim_lsp").default_capabilities()
		end

		--- Add additional capabilities to all clients
		vim.lsp.config("*", {
			capabilities = capabilities,
		})
	end,
}
