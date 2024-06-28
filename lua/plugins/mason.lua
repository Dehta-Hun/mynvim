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
					-- "ruff_lsp",
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
			lspconfig.ruff_lsp.setup({
				-- on_attach = function(client, bufnr)
				-- 	if client.name == "ruff_lsp" then
				-- 		-- Disable hover in favor of Pyright
				-- 		client.server_capabilities.hoverProvider = false
				-- 	end
				-- end,
			})
			-- lspconfig.pyright.setup({
			-- 	settings = {
			-- 		pyright = {
			-- 			-- Using Ruff's import organizer
			-- 			disableOrganizeImports = true,
			-- 		},
			-- 		python = {
			-- 			-- pythonPath = "/home/mironov_a/.virtualenv/ngfw/bin/python",
			-- 			-- venvPath = "~/.virtualenv/",
			-- 			-- venv = "~/.virtualenv/ngfw-ktt-py3.8/",
			-- 			analysis = {
			-- 				-- Ignore all files for analysis to exclusively use Ruff for linting
			-- 				ignore = { "*" },
			-- 			},
			-- 		},
			-- 	},
			-- })
			lspconfig.lua_ls.setup({})
			lspconfig.ansiblels.setup({})
			lspconfig.lemminx.setup({})
			lspconfig.docker_compose_language_service.setup({})
			lspconfig.dockerls.setup({})
			lspconfig.jedi_language_server.setup({
				init_options = {
					workspace = {
						-- extraPaths = { "/home/mironov_a/projectsGit/ci-test-scenarios/" },
					},
				},
			         })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
