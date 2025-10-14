return {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    config = function()
        require("scrollEOF").setup({
            pattern = "dap-repl*",
            insert_mode = true,
            floating = false,
            disabled_filetypes = {},
            disabled_modes = {},
        })
    end,
}
