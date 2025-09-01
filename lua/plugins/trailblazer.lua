local macos_force_mappings = {
	force_mappings = {
		nv = {
			motions = {
				new_trail_mark = "ﬁ", -- <A-l>
				track_back = "›", -- <A-b>
				peek_move_next_down = "¬", -- <A-J>
				peek_move_previous_up = "º", -- <A-K>
				move_to_nearest = "‘", -- <A-n>
				toggle_trail_mark_list = "’", -- <A-m>
			},
			actions = {
				delete_all_trail_marks = "ﬂ", -- <A-L>
				paste_at_last_trail_mark = "π", -- <A-p>
				paste_at_all_trail_marks = "∏", -- <A-P>
				set_trail_mark_select_mode = "†", -- <A-t>
				switch_to_next_trail_mark_stack = "<A-.>", -- <A-.>
				switch_to_previous_trail_mark_stack = "<A-,>", -- <A-,>
				set_trail_mark_stack_sort_mode = "<A-s>", -- <A-s>
			},
		},
	},
}

local os = vim.uv.os_uname().sysname
local opts = (os == "Darwin" and macos_force_mappings) or {}

return {
	"https://github.com/LeonHeidelbach/trailblazer.nvim",
	opts = opts,
}
