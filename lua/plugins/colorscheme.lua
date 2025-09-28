local themes = {
	["off"] = {
		"pbrisbin/vim-colors-off",
		priority = 1000,
		config = function()
			vim.opt.background = "dark"
			vim.cmd.colorscheme("off")
		end,
	},
}

vim.cmd.colorscheme("habamax")
return {}
