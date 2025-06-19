return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                python = {
                    -- To fix auto-fixable lint errors.
                    -- "ruff_fix",
                    -- To run the Ruff formatter.
                    -- "ruff_format",
                    -- To organize the imports.
                    "ruff_organize_imports",
                },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
    end,
}
