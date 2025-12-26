return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				nix = { "alejandra" },
				java = { "google-java-format" },
				zig = { "zigfmt" },
			},
			default_format_opts = {
				-- LSP formatting is used when available
				-- and then other formatters
				lsp_format = "first",
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.nix", "*.java", "*.lua", "*.zig" },
			group = vim.api.nvim_create_augroup("sk_autoformatter", { clear = true }),
			callback = function(args)
				require("conform").format({ bufnr = args.buf, async = true }, function(err, did_edit) end)
			end,
		})

		vim.api.nvim_create_autocmd("InsertLeave", {
			pattern = { "*.nix", "*.zig" },
			group = vim.api.nvim_create_augroup("sk_autoformatter", { clear = true }),
			callback = function(args)
				require("conform").format({ bufnr = args.buf, async = true }, function(err, did_edit) end)
			end,
		})
	end,
}
