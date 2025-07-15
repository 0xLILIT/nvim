return {
	"https://github.com/rhysd/clever-f.vim",
	config = function()
		-- vim.keymap.set("n", "<Leader>l", "<Plug>(clever-f-reset)", { noremap = false })
		vim.g.clever_f_smart_case = 1
		vim.g.clever_f_chars_match_any_signs = ";"
		vim.g.clever_f_timeout_ms = 1500
		vim.g.clever_f_highlight_timeout_ms = 1500
	end,
}
