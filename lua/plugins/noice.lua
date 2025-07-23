return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = false,
		},
		routes = {
			{
				filter = { event = "msg_show" },
				view = "notify",
				opts = {
					level = "info",
					skip = false,
					replace = false,
				},
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
