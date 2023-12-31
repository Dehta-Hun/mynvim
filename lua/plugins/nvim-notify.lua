return {
	"rcarriga/nvim-notify",
	lazy = false,
	config = function()
		require("notify").setup({
			-- background_colour = "#181825",
			-- render = "minimal",
			max_width = 50,
			max_height = 5,
		})
		local banned_messages = { "All parsers are up-to-date!" }
		vim.notify = function(msg, ...)
			for _, banned in ipairs(banned_messages) do
				if msg == banned then
					return
				end
			end
			require("notify")(msg, ...)
		end
	end,
}
