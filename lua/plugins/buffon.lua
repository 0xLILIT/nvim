return {
	{
		"francescarpi/buffon.nvim",
		branch = "main",
		---@type BuffonConfig
		opts = {
			--- Add your config here
			keybindings = {
				goto_next_buffer = "<C-n>",
				goto_previous_buffer = "<C-p>",
			},
			leader_key = "<Tab>",
			theme = {
				unloaded_buffer = "#404040",
				active = "#008fc5",
				shortcut = "#c6c6c6",
				unsaved_indicator = "#c6c6c6",
			},
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
		},
	},
}
