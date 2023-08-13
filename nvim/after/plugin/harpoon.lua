local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, {desc="Mark to harpoon"})
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, {desc="Show harpoon menu"})

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, {desc="Go to first harpoon mark"})
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end, {desc="Go to second harpoon mark"})
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end, {desc="Go to third harpoon mark"})
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, {desc="Go to fourth harpoon mark"})

-- Enable wrapping on harpoon menu for better readability of filenames
vim.cmd("autocmd FileType harpoon setlocal wrap");
