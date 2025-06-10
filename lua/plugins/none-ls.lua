return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.yamlfix.with({
                    extra_args = {
                        "--config-file",
                        vim.fn.expand("~/.config/nvim/lua/plugins/format_diagn/yamlfix.toml"),
                    },
                }),
                null_ls.builtins.diagnostics.yamllint.with({
                    extra_args = { "-c", vim.fn.expand("~/.config/nvim/lua/plugins/format_diagn/yamllint.yaml") },
                }),
                -- null_ls.builtins.formatting.ruff,
                -- null_ls.builtins.diagnostics.pylint,
                -- null_ls.builtins.diagnostics.mypy,
            },
        })
        vim.keymap.set("n", "gq", vim.lsp.buf.format, {})
    end,
}
