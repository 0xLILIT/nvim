return {
	"https://github.com/LeonHeidelbach/trailblazer.nvim",
	opts = {
		force_mappings = { -- rename this to "force_mappings" to completely override default mappings and not merge with them
			nv = { -- Mode union: normal & visual mode. Can be extended by adding i, x, ...
				motions = {
					new_trail_mark = "ﬁ",
					track_back = "›",
					peek_move_next_down = "¬",
					peek_move_previous_up = "º",
					move_to_nearest = "‘",
					toggle_trail_mark_list = "’",
				},
				actions = {
					delete_all_trail_marks = "ﬂ",
					paste_at_last_trail_mark = "π",
					paste_at_all_trail_marks = "∏",
					set_trail_mark_select_mode = "†",
					switch_to_next_trail_mark_stack = "<A-.>",
					switch_to_previous_trail_mark_stack = "<A-,>",
					set_trail_mark_stack_sort_mode = "<A-s>",
				},
			},
		},
	},
}
