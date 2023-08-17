-- Lua
require('lualine').setup {
    options = {
        always_divide_middle = true,
        -- ... your lualine config
        globalstatus = true,
        theme = 'tokyonight',
        -- ... your lualine config
    },
    sections = {
        lualine_x = {'searchcount', 'filetype'},
    }
}
