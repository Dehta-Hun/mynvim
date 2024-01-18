return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local utils = require("null-ls.utils")
		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.ruff,
				-- null_ls.builtins.diagnostics.mypy,
				null_ls.builtins.diagnostics.mypy.with({
				    runtime_condition = function(params)
				        return utils.path.exists(params.bufname)
				    end,
				    extra_args = {"--config-file", "/home/mironov_a/.config/mypy.ini"},
				    cwd = function () return vim.fn.getcwd() end
				}),
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.ruff.with({
					"--config",
					"$HOME/.config/ruff.toml",
				}),
				null_ls.builtins.formatting.ruff_format.with({
					"--config",
					"$HOME/.config/ruff.toml",
				}),
			},
		})
		vim.keymap.set("n", "gq", vim.lsp.buf.format, {})
	end,
}
