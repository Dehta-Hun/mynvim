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
}
