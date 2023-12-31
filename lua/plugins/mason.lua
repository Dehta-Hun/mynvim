return {
	{
		"williamboman/mason.nvim",
		-- lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ansiblels",
					-- "ansible-lint",
					-- "black",
					-- "blackd-client",
					-- "fixjson",
					-- "gitleaks",
					-- "gitlint",
					-- "gitui",
					-- "isort",
					"jedi_language_server",
					-- "json-lsp",
					-- "lemminx",
					"lua_ls",
					-- "mypy",
					-- "pylint",
					-- "shellcheck",
					-- "stylua",
				},
			})
		end,
		-- lazy = false,
		-- priority = 999,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			-- lspconfig.lua_ls.setup({})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
