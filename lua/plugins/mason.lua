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
					"ruff",
					"lua_ls",
					"jedi_language_server",
					"lemminx",
					"dockerls",
					"docker_compose_language_service",
					"jsonls",
					"yamlls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.yamlls.setup({
				settings = {
					yaml = {
						format = {
							enable = false,
						},
						customTags = "import",
					},
				},
			})
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
			lspconfig.lua_ls.setup({})
			lspconfig.ansiblels.setup({})
			lspconfig.lemminx.setup({})
			lspconfig.docker_compose_language_service.setup({})
			lspconfig.dockerls.setup({})
		end,
	},
}
