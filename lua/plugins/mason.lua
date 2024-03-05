return {
	{
		"williamboman/mason.nvim",
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
					"ruff_lsp",
					"lua_ls",
                    "jedi_language_server",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.jsonls.setup({
				settings = {
					json = {
						schemas = require("schemastore").json.schemas({
							extra = {
								{
									description = "My custom JSON schema",
									fileMatch = "test_conf.in.json",
									name = "test_conf.in.json",
									url = "/home/mironov_a/.config/schema.json",
								},
							},
						}),
						validate = { enable = true },
					},
				},
			})
			lspconfig.ansiblels.setup({})
			lspconfig.remark_ls.setup({})
            lspconfig.docker_compose_language_service.setup({})
			lspconfig.jedi_language_server.setup({
				init_options = {
					workspace = {
						extraPaths = { "/home/mironov_a/projectsGit/ci-test-scenarios/" },
					},
				},
            })
			-- lspconfig.ruff_lsp.setup({
			-- 	init_options = {
			-- 		workspace = {
			-- 			extraPaths = { "/home/mironov_a/projectsGit/ci-test-scenarios/" },
			-- 		},
			-- 	},
			-- })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
