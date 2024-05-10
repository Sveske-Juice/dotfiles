-- Mappings will be loaded after this plugin is initialized
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc="Find files"})
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc="Find project files"})
vim.keymap.set('n', '<leader>gp', builtin.live_grep, {desc="Grep string in project"})
vim.keymap.set('n', '<leader>pr', builtin.oldfiles, {desc="Find recent files"})
vim.keymap.set('n', '<leader>gc', builtin.colorscheme, {desc="Change colorscheme"})
vim.keymap.set('n', 'gp', [[:Telescope lsp_document_symbols<CR>]], {desc="Find symbols in buffer"})
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

-- UI Select
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
