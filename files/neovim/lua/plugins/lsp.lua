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
				local builtin = require("telescope.builtin")

				vim.keymap.set(
					{ "n", "v" },
					"gd",
					vim.lsp.buf.definition,
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

				local ft = vim.bo[event.buf].filetype
				if ft == "java" then
					--  jdtls is running
					local jdtls = require("jdtls")
					vim.keymap.set(
						{ "n", "v" },
						"<leader>gi",
						jdtls.organize_imports,
						{ buffer = 0, desc = "LSP: Insert imports" }
					)
					vim.keymap.set(
						{ "n", "v" },
						"<leader>gw",
						jdtls.compile,
						{ buffer = 0, desc = "LSP: Java Compile" }
					)
				end

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

		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"shfmt",
				"stylua",
				"java-test",
				"java-debug-adapter",
				"google-java-format",
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"stylua",
				"jdtls",
				"zls",
				"clangd",
			},
			automatic_installation = false,
			automatic_enable = {
				exclude = { "jdtls" },
			},
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
