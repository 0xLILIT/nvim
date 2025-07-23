return {
	"https://github.com/numToStr/FTerm.nvim",
	opts = { {
		border = "single",
		dimensions = {
			height = 0.75,
			width = 0.75,
		},
	} },
	config = function()
		vim.keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
	end,
}
