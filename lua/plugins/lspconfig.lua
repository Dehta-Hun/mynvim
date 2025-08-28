return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lspconfig = require("lspconfig")

        local capabilities_make = vim.lsp.protocol.make_client_capabilities()
        capabilities_make.textDocument.completion.completionItem.snippetSupport = true
        vim.lsp.config("html", {
            capabilities = capabilities_make,
        })

        lspconfig.ansiblels.setup({})
        lspconfig.ts_ls.setup({})
        lspconfig.lemminx.setup({})
        lspconfig.html.setup({})
        lspconfig.docker_compose_language_service.setup({})
        lspconfig.dockerls.setup({})
        lspconfig.bashls.setup({
            filetypes = { "bash", "sh", "zsh" },
            settings = {
                bashIde = {
                    globPattern = "*@(.sh|.inc|.bash|.zsh|.command)",
                },
            },
        })
        lspconfig.jsonls.setup({
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas({}),
                    validate = { enable = true },
                },
            },
        })
        lspconfig.jedi_language_server.setup({
            root_dir = function()
                return vim.fn.getcwd()
            end,
            init_options = {
                workspace = {},
            },
        })
        local capabilities_nvim_lsp = require("cmp_nvim_lsp").default_capabilities()
        lspconfig.lua_ls.setup({
            capabilities = capabilities_nvim_lsp,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                },
            },
        })
        require("lspconfig")["ruff"].setup({
            init_options = {
                settings = {
                    configuration = "~/Corp-FWaaS/test/pyproject.toml",
                    args = {},
                },
            },
            root_dir = function()
                return vim.fn.getcwd()
            end,
            capabilities = capabilities_nvim_lsp,
            on_attach = function(client, bufnr)
                if
                    client.supports_method("textDocument/formatting") and client.config.root_dir:match("Corp%-FWaaS")
                then
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
        })
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
