return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				nix = { "alejandra" },
				java = { "google-java-format" },
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.nix", "*.java", "*.lua" },
			group = vim.api.nvim_create_augroup("sk_autoformatter", { clear = true }),
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
