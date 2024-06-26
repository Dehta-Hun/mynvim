require("mironovak")
require("config.lazy")
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
