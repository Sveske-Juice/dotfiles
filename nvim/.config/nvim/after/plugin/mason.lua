local lsp = require("lsp-zero")
local lspconf = require("lspconfig")

require("mason").setup()

require("mason-tool-installer").setup({
	ensure_installed = {
		-- LANGUAGES
		"lua_ls", -- lua
		"bashls", -- shell
		"clangd", -- C/C++
		"arduino_language_server", -- Arduino
		"jedi_language_server", -- python
		-- "omnisharp", -- C#
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
		-- LSP Specific configuration, see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
		omnisharp = function()
			lspconf.omnisharp.setup({
				on_attach = function(client, bufnr)
					-- Fix error with omnisharp, see https://github.com/williamboman/mason-lspconfig.nvim/issues/211
					client.server_capabilities.semanticTokensProvider = false
				end,
			})
		end,
		lua_ls = function()
            lspconf.lua_ls.setup({
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
                        client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT",
                                },
                                -- Make the server aware of Neovim runtime files
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME,
                                        -- "${3rd}/luv/library"
                                        -- "${3rd}/busted/library",
                                    },
                                },
                            },
                        })

                        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                    end
                    return true
                end
            })
		end,
		clangd = function()
			lspconf.clangd.setup({
				on_attach = function(client, bufnr)
                    -- Configure special things for clangd, see https://github.com/p00f/clangd_extensions.nvim
					local clangext = require("clangd_extensions.inlay_hints")
					if clangext then
						clangext.setup_autocmd()
						clangext.set_inlay_hints()
					end

                    vim.keymap.set('n', "gh", [[:ClangdSwitchSourceHeader<CR>]], {desc="Switch to source/header file"})
				end,
				inlay_hints = {
					inline = vim.fn.has("nvim-0.10") == 1,
					-- Options other than `highlight' and `priority' only work
					-- if `inline' is disabled
					-- Only show inlay hints for the current line
					only_current_line = false,
					-- Event which triggers a refresh of the inlay hints.
					-- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
					-- not that this may cause  higher CPU usage.
					-- This option is only respected when only_current_line and
					-- autoSetHints both are true.
					only_current_line_autocmd = { "CursorHold" },
					-- whether to show parameter hints with the inlay hints or not
					show_parameter_hints = true,
					-- prefix for parameter hints
					parameter_hints_prefix = ": ",
					-- prefix for all the other hints (type, chaining)
					other_hints_prefix = "=> ",
					-- whether to align to the length of the longest line in the file
					max_len_align = false,
					-- padding from the left if max_len_align is true
					max_len_align_padding = 1,
					-- whether to align to the extreme right or not
					right_align = false,
					-- padding from the right if right_align is true
					right_align_padding = 7,
					-- The color of the hints
					highlight = "Comment",
					-- The highlight group priority for extmark
					priority = 100,
				},
				ast = {
					-- These are unicode, should be available in any font
					role_icons = {
						type = "🄣",
						declaration = "🄓",
						expression = "🄔",
						statement = ";",
						specifier = "🄢",
						["template argument"] = "🆃",
					},
					kind_icons = {
						Compound = "🄲",
						Recovery = "🅁",
						TranslationUnit = "🅄",
						PackExpansion = "🄿",
						TemplateTypeParm = "🅃",
						TemplateTemplateParm = "🅃",
						TemplateParamObject = "🅃",
					},
					highlights = {
						detail = "Comment",
					},
				},
				memory_usage = {
					border = "none",
				},
				symbol_info = {
					border = "none",
				},
			})
		end,
	},
})
