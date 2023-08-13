local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {desc="Go to definition", buffer=bufnr, remap=false})
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {desc="Show info in floating window", buffer=bufnr, remap=false})
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, {desc="", buffer=bufnr, remap=false})
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {desc="", buffer=bufnr, remap=false})
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {desc="Go to next diagnostic", buffer=bufnr, remap=false})
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {desc="Go to previous diagnostic", buffer=bufnr, remap=false})
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, {desc="Code actions", buffer=bufnr, remap=false})
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, {desc="See references", buffer=bufnr, remap=false})
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, {desc="Rename symbol", buffer=bufnr, remap=false})
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {desc="Show signuture info", buffer=bufnr, remap=false})

  -- Fix error with omnisharp, see https://github.com/williamboman/mason-lspconfig.nvim/issues/211
  client.server_capabilities.semanticTokensProvider = nil
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.set_sign_icons({
    error = '✘ ',
    warn = ' ',
    info = '» ',
    hint = '⚑ ',
})

lsp.setup()
