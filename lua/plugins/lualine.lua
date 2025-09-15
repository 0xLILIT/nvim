return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "auto",
			disabled_filetypes = { "alpha" },
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff" },
			lualine_c = { { "buffers", buffers_color = { active = "lualine_a_normal" } } },
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "datetime" },
		},
	},
}
