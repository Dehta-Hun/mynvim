require("mironovak")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
require("telescope").setup({
	defaults = { -- -- убрать локал если что то пойдет не так
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"-u", -- thats the new thing
			"-u", -- thats the new thing
		},
	},
})
