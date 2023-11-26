require("ibl").setup {
    enabled = true,
    debounce = 200,
    indent = {
        char = "¦",
        tab_char = "|",
        smart_indent_cap = true,
    },
    whitespace = { remove_blankline_trail = true },

    scope = {
        enabled = false
    }
}
