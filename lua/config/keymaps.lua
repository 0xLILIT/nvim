-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Motions
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")
vim.keymap.set({ "n", "v", "o" }, "J", "}")
vim.keymap.set({ "n", "v", "o" }, "K", "{")
vim.keymap.set({ "n", "v", "o" }, "H", "^")
vim.keymap.set({ "n", "v", "o" }, "L", "$")
vim.keymap.set({ "n", "v" }, "√", "+")
vim.keymap.set({ "n", "v" }, "ª", "-")

-- LSPSaga
vim.keymap.set("n", "<leader>hh", "<cmd>Lspsaga hover_doc<cr>", { desc = "Show hover information" })
vim.keymap.set("n", "<leader>rr", "<cmd>Lspsaga rename<cr>", { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<cr>", { desc = "Jump to definition" })
vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek definition" })
vim.keymap.set("n", "<leader>cc", "<cmd>Lspsaga incoming_calls<cr>", { desc = "Show incoming calls" })
vim.keymap.set("n", "<leader>cC", "<cmd>Lspsaga outgoing_calls<cr>", { desc = "Show outgoing calls" })
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", { desc = "Code action" })
vim.keymap.set("n", "<leader>dd", "<cmd>Lspsaga show_line_diagnostics<cr>", { desc = "Show line diagnostics" })
vim.keymap.set("n", "<leader>dD", "<cmd>Lspsaga show_buf_diagnostics<cr>", { desc = "Show buffer diagnostics" })

-- Oil
vim.keymap.set("n", "<leader>e", "<cmd>Oil --float<cr>", { desc = "Open Oil" })
-- vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open Oil" })

-- Diffview
vim.keymap.set("n", "dvo", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
vim.keymap.set("n", "dvc", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })

-- Buffers
vim.keymap.set("n", "<C-x>", "<cmd>bdelete<cr>")
vim.keymap.set("n", "<C-n>", "<cmd>bnext<cr>")
vim.keymap.set("n", "<C-p>", "<cmd>bprevious<cr>")
vim.keymap.set("n", "<C-q>", "<cmd>b#<cr>")

-- Windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { remap = true })

-- Gitsigns
vim.keymap.set("n", "gb", "<cmd>Gitsigns blame_line<cr>")
vim.keymap.set("n", "gB", "<cmd>Gitsigns blame<cr>")
vim.keymap.set("n", "gh", "<cmd>Gitsigns preview_hunk_inline<cr>")
vim.keymap.set("n", "gH", "<cmd>Gitsigns preview_hunk<cr>")

-- Other
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("n", "<leader>cs", function()
	local primary_colorscheme = "emperor"
	local secondary_colorscheme = "windir"
	local cur_colorscheme = vim.g.colors_name or "default"
	if cur_colorscheme == primary_colorscheme then
		vim.cmd.colorscheme(secondary_colorscheme)
	elseif cur_colorscheme == secondary_colorscheme then
		vim.cmd.colorscheme(primary_colorscheme)
	end
end, { desc = "Toggle syntax highlighting" })
