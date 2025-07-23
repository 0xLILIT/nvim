return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		enabled = function()
			local filetype = vim.bo.filetype
			return filetype ~= "oil"
		end,
		keymap = {
			preset = "enter",
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = { auto_show = true },
			ghost_text = { enabled = true, show_with_menu = false },
			menu = { auto_show = false },
		},
		signature = { enabled = true },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
