local builtin = require('telescope.builtin')
local keymap = vim.keymap.set
local tb = require('telescope.builtin')
local opts = { noremap = true, silent = true }
function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end
keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fg', builtin.git_files, {})
keymap('n', '<leader>fs', builtin.live_grep, {})
keymap('n', '<leader>fb', builtin.buffers, {})
keymap('n', '<leader>fh', builtin.help_tags, {})
keymap('n', '<leader>fz', builtin.current_buffer_fuzzy_find, {})
-- keymap('n', '<leader>g', ':Telescope current_buffer_fuzzy_find<cr>', opts)
keymap('v', '<leader>fZ', function()
	local text = vim.getVisualSelection()
	tb.current_buffer_fuzzy_find({ default_text = text })
end, opts)

-- keymap('n', '<leader>G', ':Telescope live_grep<cr>', opts)
keymap('v', '<leader>fS', function()
	local text = vim.getVisualSelection()
	tb.live_grep({ default_text = text })
end, opts)
