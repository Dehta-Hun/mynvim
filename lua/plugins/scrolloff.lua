return {
  "Aasim-A/scrollEOF.nvim",
  event = { "CursorMoved", "WinScrolled" },
  config = function ()
    require("scrollEOF").setup({
      pattern = "*",
      insert_mode = true,
      floating = false,
      disabled_filetypes = {},
      disabled_modes = { "t", "nt" },
      prehook = function (bufnr)
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        -- bufname = vim.fn.fnamemodify(bufname, ":t") -- only the basename

        if bufname:match("/%[dap.*") then
          return false -- disable scrollEOF for this buffer
        end
        return false
      end,
    })
  end,
}
