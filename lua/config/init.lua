require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.autocmds")

local hl = vim.api.nvim_set_hl
hl(0, "BlinkCmpGhostText", { fg = "#999999", bg = "#343434" })
