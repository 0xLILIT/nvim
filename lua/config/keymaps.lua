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

-- Oil
vim.keymap.set("n", "<leader>e", "<cmd>Oil --float<cr>", { desc = "Open Oil" })

-- Buffers
vim.keymap.set("n", "<C-x>", "<cmd>bdelete<cr>")
-- vim.keymap.set("n", "<C-n>", "<cmd>bnext<cr>")
-- vim.keymap.set("n", "<C-p>", "<cmd>bprevious<cr>")
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

-- LSP
vim.keymap.set("n", "grh", vim.lsp.buf.hover, { desc = "Show hover information about symbol" })
vim.keymap.set("n", "grs", vim.lsp.buf.signature_help, { desc = "Show signature information about symbol" })

-- Other
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("n", "<leader>cs", function()
	local primary_colorscheme = "emperor"
	local secondary_colorscheme = "windir"
	local cur_colorscheme = vim.g.colors_name or "default"

	if cur_colorscheme == primary_colorscheme then
		vim.cmd.colorscheme(secondary_colorscheme)
	else
		vim.cmd.colorscheme(primary_colorscheme)
	end
end, { desc = "Toggle colorscheme" })
