return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{
			"OXY2DEV/markview.nvim",
			lazy = false,

			-- For `nvim-treesitter` users.
			priority = 49,

			-- For blink.cmp's completion
			-- source
			-- dependencies = {
			--     "saghen/blink.cmp"
			-- },
		},
	},
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"cpp",
				"java",
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"html",
				"css",
				"typescript",
				"scss",
				"sql",
				"php",
				"json",
				"markdown",
				"markdown_inline",
				"latex",
				"typst",
				"yaml",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
