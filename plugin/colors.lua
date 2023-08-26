function ColourMyPencils(color)
	color = color or "tokyonight-storm"
	vim.cmd.colorscheme(color)
    require("tokyonight").setup{ transparent = vim.g.transparent_enabled }
end
ColourMyPencils()
