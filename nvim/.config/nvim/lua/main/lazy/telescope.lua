return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local builtin = require('telescope.builtin');
        vim.keymap.set('n', '<C-p>', builtin.find_files, {desc="Find Files"});
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, {desc="Grep string in files"});
        vim.keymap.set('n', '<leader>pc', builtin.colorscheme, {desc="Change colorscheme"});

        vim.keymap.set('n', 'gr', builtin.lsp_references, {desc="Find references"});
        vim.keymap.set('n', 'gp', builtin.lsp_document_symbols, {desc="Find symbols in buffer"});
        vim.keymap.set('n', '<leader>gp', builtin.lsp_workspace_symbols, {desc="Find symbols in workspace"});

        require("telescope").setup({
            defaults = {
                file_ignore_patterns = {
                    ".meta", -- Unity files
                },
            },
            pickers = {
                live_grep = {
                    additional_args = function()
                        return {
                            "--pre-glob='!*.meta \
                            !*.unity'"
                        }
                    end
                }
            },
        });

    end
}
