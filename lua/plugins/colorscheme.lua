local themes = {
	["zenbones"] = {
		"zenbones-theme/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		-- you can set set configuration options here
		config = function()
			-- vim.g.zenbones_darken_comments = 45
			vim.o.background = "dark"
			vim.cmd.colorscheme("zenwritten")
		end,
	},
	["off"] = {
		"pbrisbin/vim-colors-off",
		priority = 1000,
		config = function()
			vim.opt.background = "dark"
			vim.cmd.colorscheme("off")
		end,
	},
}

return themes["off"]
