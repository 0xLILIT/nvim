---@diagnostic disable: undefined-global
-- Create undo directory if it doesn't exist
-- local undo_dir = "/Users/frejatornlund/.vim-undo-dir"
-- local uv = vim.loop

-- if not uv.fs_stat(undo_dir) then
--   uv.fs_mkdir(undo_dir, 700)
-- end

-- Set the undo directory and enable persistent undo
-- vim.opt.undodir = undo_dir
-- vim.opt.undofile = true

vim.opt.undofile = true -- Enable persistent undo
vim.opt.undodir = vim.fn.expand("~/.undodir") -- Set custom undo directory

-- Indenting
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 2 -- Number of spaces inserted when indenting

-- UI
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.showmode = false

-- Other
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.diagnostic.config({ virtual_lines = true, virtual_text = false })
