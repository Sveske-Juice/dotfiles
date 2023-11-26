local lsp = require("lsp-zero")

require("mason").setup();

require("mason-tool-installer").setup({
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

        -- FORMATTERS
        "stylua", -- Lua
        "usort", -- Python import sort
        "black", -- Python
        "prettier", -- HTML, CSS, JS/TS, JSON
        "clang-format", -- C/C#/C++
        "jq", -- JSON
        "csharpier", -- C#
    },
})

-- Auto configure LSP servers
require("mason-lspconfig").setup({
    handlers = {
        lsp.default_setup,
    }
})
