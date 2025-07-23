-- Persistent undo
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
vim.opt.cursorline = true

-- Other
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.winborder = "single"
vim.opt.scrolloff = 12
