local ruff_on_attach = function(client, bufnr)
	if client.name == "ruff_lsp" then
		-- Disable hover in favor of Pyright
		client.server_capabilities.hoverProvider = false
	end
end
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
			lspconfig.ansiblels.setup({})
			lspconfig.lemminx.setup({})
			lspconfig.remark_ls.setup({})
			lspconfig.docker_compose_language_service.setup({})
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
			lspconfig.pyright.setup({
				settings = {
					pyright = {
						-- Using Ruff's import organizer
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							-- Ignore all files for analysis to exclusively use Ruff for linting
							ignore = { "*" },
						},
					},
				},
			})
			lspconfig.ruff_lsp.setup({
				on_attach = ruff_on_attach,
				init_options = {
					workspace = {
						config = "$HOME/.config/ruff.toml",
					},
				},
			})
			-- lspconfig.jedi_language_server.setup({
			-- 	init_options = {
			-- 		workspace = {
			-- 			extraPaths = { "/home/mironov_a/projectsGit/ci-test-scenarios/" },
			-- 		},
			-- 	},
			--          })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
