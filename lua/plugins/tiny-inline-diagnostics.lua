return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy", -- Or `LspAttach`
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "classic",
			signs = {
				left = "",
				right = "",
				diag = "●",
				arrow = "",
				up_arrow = "",
				vertical = " │",
				vertical_end = " └",
			},
			transparent_bg = true,
			options = {
				show_source = {
					enabled = true,
				},
				multilines = {
					enabled = true,
					always_show = true,
				},
			},
		})
		vim.diagnostic.config({ virtual_text = false })
	end,
}
