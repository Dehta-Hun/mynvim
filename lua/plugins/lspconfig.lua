return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = "󰋼 ",
					[vim.diagnostic.severity.HINT] = "󰌵 ",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "Error",
					[vim.diagnostic.severity.WARN] = "Warn",
					[vim.diagnostic.severity.HINT] = "Hint",
					[vim.diagnostic.severity.INFO] = "Info",
				},
			},
		})
		lspconfig.jsonls.setup({
			settings = {
				json = {
					schemas = require("schemastore").json.schemas({
						-- extra = {
						-- 	{
						-- 		description = "My custom JSON schema",
						-- 		fileMatch = "test_conf.in.json",
						-- 		name = "test_conf.in.json",
						-- 		url = "$HOME/.cache/schema.json",
						-- 	},
						-- },
					}),
					validate = { enable = true },
				},
			},
		})
		lspconfig.jedi_language_server.setup({
			root_dir = function(fname)
				return vim.fn.getcwd()
			end,
			init_options = {
				workspace = {
					-- extraPaths = { "/home/mironov_a/projectsGit/ci-test-scenarios/" },
				},
			},
		})
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
				},
			},
		})
		lspconfig.ansiblels.setup({})
		lspconfig.lemminx.setup({})
		lspconfig.docker_compose_language_service.setup({})
		lspconfig.dockerls.setup({})
	end,
}
