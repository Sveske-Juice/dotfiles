vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc="Move Line Down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc="Move Line Up"})

-- Clipping
vim.keymap.set("n", "<leader>y", "\"+y", {desc="Copy to system clipboard"})
vim.keymap.set("v", "<leader>y", "\"+y", {desc="Copy to system clipboard"})
vim.keymap.set("n", "<leader>Y", "\"+Y", {desc="Copy line to system clipboard"})

-- Delete to void register
vim.keymap.set("n", "<leader>d", "\"_d", {desc="Delete to void register"})
vim.keymap.set("v", "<leader>d", "\"_d", {desc="Delete to void register"})

-- TODO: https://www.youtube.com/watch?v=w7i4amO_zaE&t=558s
vim.keymap.set("n", "<C-f>", "<cmd>!tmux neww tmux-sessionizer<CR>")

-- Replace word currently hovering
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc="Replace hovered word with"})

-- Delete current tab and go back to previos buffer
vim.keymap.set("n", "<leader>q", [[:b#|bd#<CR>]], {desc="Close current buffer"})

-- Go half a page up and down while keeping cursor vertically centered
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc="Move half page down"});
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc="Move half page up"});

-- Go back to last edited buffer shortcut
vim.keymap.set("n", "<C-o>", [[:e #<CR>]], {desc="Go back to last buffer"});

-- Keep cursor vertically centered when going to next/previos
vim.keymap.set("n", "n", "nzzzv");
vim.keymap.set("n", "N", "Nzzzv");

-- vim.keymap.set("n", "<F5>", [[:Make<CR>]], {desc="Make project"});

-- Dispatch will build the file depending on the vim-dispatch specific compilation method specified for the language in set.lua. 
-- vim.keymap.set("n", "<F5>", [[:Dispatch<CR>]], {desc="Make file"});

-- It will then run the executable which is assumed to be named the source file without the extension (%< is the file name without extension)
-- vim.keymap.set("n", "<F6>", [[:term ./%< && rm %< <CR>]], {desc="Run compiled file"});

-- Disable c-space - for me the keybinding would paste copied text which is annoying
vim.keymap.set("i", "<C-space>", [[<Nop>]]);

vim.keymap.set("n", "sv", [[:source $XDG_CONFIG_HOME/nvim/init.lua<CR>]], {desc="Reload neovim config"});








