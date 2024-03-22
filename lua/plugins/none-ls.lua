return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local utils = require("null-ls.utils")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.yamlfix,
				null_ls.builtins.diagnostics.yamllint.with({
					extra_args = { "-c", vim.fn.expand("~/.config/nvim/lua/configs/yamllint.yaml") },
				}),
			},
		})
		vim.keymap.set("n", "gq", vim.lsp.buf.format, {})
	end,
}
