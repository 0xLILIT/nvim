local themes = {
	["e-ink"] = {
		"e-ink-colorscheme/e-ink.nvim",
		priority = 1000,
		config = function()
			require("e-ink").setup()
			vim.cmd.colorscheme("e-ink")
			vim.opt.background = "dark"
		end,
	},
	["black-metal-theme-neovim"] = {
		"metalelf0/black-metal-theme-neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("black-metal").setup({
				-- theme = "windir",
				theme = "emperor",
				variant = "dark",
				-- alt_bg = true,
			})
			require("black-metal").load()
			-- vim.api.nvim_set_hl(0, "String", { fg = "#A9A976" })
			-- vim.api.nvim_set_hl(0, "Normal", { bg = "#181818" })
		end,
	},
	["vim-ascetic"] = {
		"https://github.com/aos/vim-ascetic",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("ascetic")
			vim.opt.background = "dark"
		end,
	},
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
}

return themes["black-metal-theme-neovim"]
