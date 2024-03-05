vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.timeoutlen = 800

-- vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.formatoptions = "ct"

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true

vim.opt.cursorline = true
vim.cmd("let g:rnvimr_enable_picker = 1")

vim.filetype.add({
	extension = {
		bpt = "xml", -- treat bpt as xml
	},
	filename = {
        ['docker-compose.yaml'] = 'yaml.docker-compose',
        ['docker-compose.yml'] = 'yaml.docker-compose',
    },
	pattern = {
		[".*ansible(.*/?)(.*/?)(.*/?)(.*/?)%w*.ya?ml"] = "yaml.ansible", -- treat ansible directory as ansible playbooks
	},
})
-- RSync repo to testmachine
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		local path = vim.api.nvim_buf_get_name(0):match(".*projectsGit(.*/?)(.*/?)(.*/?)(.*/?)(.*/?)(.*/?)(.*/?)%w*.$")
		if path then
			os.execute(
				'tmux new-session -d "rsync -aP ~/projectsGit/Corp-FWaaS qc-fwaas-manual-kvm-mironov.avp.ru:/home/mironov_a/ > /dev/null 2>&1"'
			)
		end
	end,
})
-- Cyrillic support
vim.opt.langmap =
	"йЙцЦуУкКеЕнНгГшШщЩзЗхХъЪфФыЫвВаАпПрРоОлЛдДжЖэЭяЯчЧсСмМиИтТьЬбБюЮ.\\,;qQwWeErRtTyYuUiIoOpP[{]}aAsSdDfFgGhHjJkKlL;:'\"zZxXcCvVbBnNmM\\,<.>/?"
