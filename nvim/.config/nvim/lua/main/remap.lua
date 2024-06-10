vim.g.mapleader = " ";
vim.g.maploaclleader = " ";

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc="File Explorer"});

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc="Move Line Down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc="Move Line Up"})

-- Vertical jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc="Page Down"});
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc="Page Up"});
vim.keymap.set("n", "n", "nzzzv");
vim.keymap.set("n", "N", "Nzzzv");

-- Replace word currently hovering
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc="Replace hovered word"})

-- Previous and Next buffer
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious, {desc="Previous Buffer"});
vim.keymap.set("n", "<Tab>", vim.cmd.bnext, {desc="Next Buffer"});
vim.keymap.set("n", "<C-o>", "<nop>");

vim.keymap.set("x", "<leader>p", "\"_dP", {desc="Paste void register"});
vim.keymap.set("v", "<leader>y", "\"+y", {desc="Yank to system clipboard"});
vim.keymap.set("n", "<leader>Y", "\"+Y", {desc="Yank to system clipboard"});
vim.keymap.set("n", "<leader>d", "\"_d", {desc="Delete to void register"});
vim.keymap.set("v", "<leader>d", "\"_d", {desc="Delete to void register"});
