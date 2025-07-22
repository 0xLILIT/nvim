-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- {
		-- 	"milanglacier/minuet-ai.nvim",
		-- 	dependencies = { "nvim-lua/plenary.nvim" },
		-- 	opts = {
		-- 		provider = "openai_fim_compatible",
		-- 		n_completions = 1, -- recommend for local model for resource saving
		-- 		-- I recommend beginning with a small context window size and incrementally
		-- 		-- expanding it, depending on your local computing power. A context window
		-- 		-- of 512, serves as an good starting point to estimate your computing
		-- 		-- power. Once you have a reliable estimate of your local computing power,
		-- 		-- you should adjust the context window to a larger value.
		-- 		-- context_window = 1024,
		-- 		context_window = 512,
		-- 		provider_options = {
		-- 			openai_fim_compatible = {
		-- 				-- For Windows users, TERM may not be present in environment variables.
		-- 				-- Consider using APPDATA instead.
		-- 				api_key = "TERM",
		-- 				name = "Ollama",
		-- 				end_point = "http://localhost:11434/v1/completions",
		-- 				model = "qwen2.5-coder:1.5b",
		-- 				optional = {
		-- 					max_tokens = 56,
		-- 					-- max_tokens = 256,
		-- 					top_p = 0.5,
		-- 				},
		-- 			},
		-- 		},
		-- 		-- Your configuration options here
		-- 	},
		-- },
		-- add this to the file where you setup your other plugins:
		{ import = "plugins" },
		{
			"monkoose/neocodeium",
			event = "VeryLazy",
			config = function()
				local neocodeium = require("neocodeium")
				neocodeium.setup({
					filter = function()
						local blink = require("blink.cmp")
						return not blink.is_visible()
					end,
				})
				vim.keymap.set("i", "<A-f>", function()
					require("neocodeium").accept()
				end)
				vim.keymap.set("i", "<A-w>", function()
					require("neocodeium").accept_word()
				end)
				vim.keymap.set("i", "<A-a>", function()
					require("neocodeium").accept_line()
				end)
				vim.keymap.set("i", "<A-e>", function()
					require("neocodeium").cycle_or_complete()
				end)
				vim.keymap.set("i", "<A-r>", function()
					require("neocodeium").cycle_or_complete(-1)
				end)
				vim.keymap.set("i", "<A-c>", function()
					require("neocodeium").clear()
				end)
			end,
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "e-ink" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
