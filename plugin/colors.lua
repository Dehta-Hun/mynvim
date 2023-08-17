function ColourMyPencils(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "Normalfloat", { bg = "none" })
    require("tokyonight").setup{ transparent = vim.g.transparent_enabled }
end

ColourMyPencils()
