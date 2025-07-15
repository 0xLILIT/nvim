return {
	"ggandor/leap.nvim",
	dependencies = { "https://github.com/tpope/vim-repeat" },
	enabled = true,
	keys = {
		{ "s", mode = { "n", "x", "o" }, desc = "Leap Forward to" },
		{ "S", mode = { "n", "x", "o" }, desc = "Leap Backward to" },
		{ "gs", mode = { "n", "x", "o" }, desc = "Leap from Windows" },
	},
	config = function(_, opts)
		local leap = require("leap")
		for k, v in pairs(opts) do
			leap.opts[k] = v
		end
		leap.add_default_mappings(true)
		vim.keymap.del({ "x", "o" }, "x")
		vim.keymap.del({ "x", "o" }, "X")

		-- Exclude whitespace and the middle of alphabetic words from preview:
		--   foobar[baaz] = quux
		--   ^----^^^--^^-^-^--^
		leap.opts.preview_filter = function(ch0, ch1, ch2)
			return not (ch1:match("%s") or ch0:match("%a") and ch1:match("%a") and ch2:match("%a"))
		end
		leap.opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }
		require("leap.user").set_repeat_keys("<enter>", "<backspace>")
		vim.api.nvim_set_hl(0, "LeapLabel", { default = true, link = "Cursor" })
	end,
}
