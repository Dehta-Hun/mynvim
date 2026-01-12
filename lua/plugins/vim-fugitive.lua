return {
  "tpope/vim-fugitive",
  lazy = false,
  config = function()
    -- replace "git" with "Git" for convinience 
    vim.cmd([[ cabbrev <expr> git getcmdtype() == ':' && getcmdline() ==# 'git' ? 'Git' : 'git' ]])
  end,
}
