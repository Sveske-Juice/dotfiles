-- Mappings will be loaded after this plugin is initialized
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc="Find files"})
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc="Find project files"})
vim.keymap.set('n', '<leader>gp', builtin.live_grep, {desc="Grep string in project"})
vim.keymap.set('n', '<leader>pr', builtin.oldfiles, {desc="Find recent files"})
vim.keymap.set('n', '<leader>gc', builtin.colorscheme, {desc="Change colorscheme"})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep: ") }); end, {desc="Search for content in file"})

require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            ".meta" -- For unity
        },
    },
    pickers = {
        live_grep = {
            -- Hide .meta and .unity files from live grepping
            additional_args = function()
                return {
                    "--pre-glob='!*.meta \
                    !*.unity'"}
            end
        }
    }
})
