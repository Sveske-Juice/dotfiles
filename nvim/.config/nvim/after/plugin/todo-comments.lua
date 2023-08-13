require("todo-comments").setup()

-- Use telescope to open window with all todos in project
vim.keymap.set("n", "<leader>to", [[:TodoTelescope<CR>]])
