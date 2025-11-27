return {
  {
    "mason-org/mason.nvim",
    config = function ()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function ()
      require("mason-lspconfig").setup({
        automatic_enable = false,
        ensure_installed = {
          "ansiblels",
          "ruff",
          "lua_ls",
          "jedi_language_server",
          "lemminx",
          "dockerls",
          "docker_compose_language_service",
          "jsonls",
          "gopls",
        },
      })
    end,
  },
}
