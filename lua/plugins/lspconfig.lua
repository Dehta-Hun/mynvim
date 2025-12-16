return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = vim.lsp.config

    --lsp keybinds
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    vim.keymap.set("n", "K", vim.lsp.buf.hover)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "gq", vim.lsp.buf.format, {})

    vim.lsp.enable({
      "basedpyright",
      -- "jedi_language_server",
      "ruff",
      "ansiblels",
      "vtsls",
      "ts_ls",
      "lemminx",
      "html",
      "docker_compose_language_service",
      "dockerls",
      "bashls",
      "jsonls",
      "lua_ls",
      "gopls",
    })
    lspconfig["jedi_language_server"] = {}
    lspconfig["basedpyright"] = {
      settings = {
        basedpyright = {
          disableOrganizeImports = true,
          -- disableLanguageServices = true,
          analysis = {
            typeCheckingMode = "basic",
            inlayHints = {
              variableTypes = false,
              callArgumentNames = false,
              callArgumentNamesMatching = false,
              functionReturnTypes = false,
              genericTypes = false,
              reportUnknownParameterType = false,
            },
          },
        },
      },
    }

    local html_capabilities = vim.lsp.protocol.make_client_capabilities()
    html_capabilities.textDocument.completion.completionItem.snippetSupport = true
    lspconfig["html"] = {
      capabilities = html_capabilities,
    }

    lspconfig["bashls"] = {
      filetypes = { "bash", "sh", "zsh" },
      settings = {
        bashIde = {
          globPattern = "*@(.sh|.inc|.bash|.zsh|.command)",
        },
      },
    }

    lspconfig["jsonls"] = {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas({}),
          validate = { enable = true },
        },
      },
    }

    -- local capabilities_nvim_lsp = require("cmp_nvim_lsp").default_capabilities()
    lspconfig["lua_ls"] = {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    }

    lspconfig["ruff"] = {
      init_options = {
        settings = {
          configuration = "~/Corp-FWaaS/test/pyproject.toml",
          args = {},
        },
      },
      capabilities = {
        general = {
          positionEncodings = { "utf-16" },
        },
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") and client.config.root_dir:match("Corp%-FWaaS") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end
      end,
    }

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.HINT] = " ",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "Error",
          [vim.diagnostic.severity.WARN] = "Warn",
          [vim.diagnostic.severity.HINT] = "Hint",
          [vim.diagnostic.severity.INFO] = "Info",
        },
      },
    })
  end,
}
