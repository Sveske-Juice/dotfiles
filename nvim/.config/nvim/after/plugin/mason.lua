require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        -- LANGUAGES
        "lua_ls", -- lua
        "bashls", -- shell
        "clangd", -- C/C++
        "arduino_language_server", -- Arduino
        "jedi_language_server", -- python
        "omnisharp", -- C#
        "tsserver", -- Type/Java script

        -- MARKUP
        "html", -- HTML
        "cssls", -- CSS
        "jqls", -- JSON
        "sqlls", -- SQL
        "ltex", -- LaTeX
        "marksman", -- Markdown
        "lemminx", -- XML
        "yamlls", -- YAML

        -- BUILD ENV
        "cmake", -- CMake
        "autotools_ls", -- Make
    }
})
