return {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    config = function()
        require("scrollEOF").setup({
            pattern = "*",
            insert_mode = true,
            floating = false,
            disabled_filetypes = {},
            disabled_modes = {},
        })
    end,
}
