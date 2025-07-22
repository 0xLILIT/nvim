require("config.lazy")
require("config.options")
require("config.keymaps")

-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.cmd('normal! g`"zz')
		end
	end,
})

local hl = vim.api.nvim_set_hl
hl(0, "BlinkCmpGhostText", { fg = "#999999", bg = "#343434" })

local neocodeium = require("neocodeium")

vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuOpen",
	callback = function()
		neocodeium.clear()
	end,
})
