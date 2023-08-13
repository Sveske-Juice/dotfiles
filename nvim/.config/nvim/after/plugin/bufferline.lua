-- local bufferline = require("bufferline");

--[[ bufferline.setup({
    options = {
        numbers = "none",

        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. count
        end,

        separator_style = "slope",

        offsets = {
            {
                filetype = "neo-tree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true
            }
        }
    }
}); ]]

