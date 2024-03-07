return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local utils = require("null-ls.utils")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.stylua,
			},
		})
		vim.keymap.set("n", "gq", vim.lsp.buf.format, {})
	end,
}
