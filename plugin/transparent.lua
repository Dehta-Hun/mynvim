require("transparent").setup({
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer', 'NvimTree_1',
  },
  extra_groups = {'NvimTreeNormal', 'NormalFloat','NvimTreeNormalNC'}, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})
-- require("tokyonight").setup{ transparent = vim.g.transparent_enabled }
