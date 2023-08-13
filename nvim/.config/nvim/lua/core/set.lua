-- vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })

-- Line numbers
vim.opt.nu = true

-- Relative line numbers
vim.opt.relativenumber = true

-- Tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- no backup - let undotree handle it
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

--vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.wrap = false

-- Language specific vim.dispatch ompilation
-- Use make implicit makefile rules for c++:
vim.cmd("autocmd FileType cpp let b:dispatch = 'make %<'");
