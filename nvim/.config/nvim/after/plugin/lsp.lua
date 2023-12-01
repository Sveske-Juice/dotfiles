local lsp = require("lsp-zero")
local lspconf = require("lspconfig")
local cmp = require("cmp")

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.on_attach(function(client, bufnr)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = bufnr, remap = false })
	vim.keymap.set(
		"n",
		"K",
		vim.lsp.buf.hover,
		{ desc = "Show info in floating window", buffer = bufnr, remap = false }
	)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { desc = "", buffer = bufnr, remap = false })
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "", buffer = bufnr, remap = false })
	vim.keymap.set(
		"n",
		"[d",
		vim.diagnostic.goto_next,
		{ desc = "Go to next diagnostic", buffer = bufnr, remap = false }
	)
	vim.keymap.set(
		"n",
		"]d",
		vim.diagnostic.goto_prev,
		{ desc = "Go to previous diagnostic", buffer = bufnr, remap = false }
	)
	vim.keymap.set(
		"n",
		"<leader>vca",
		vim.lsp.buf.code_action,
		{ desc = "Code actions", buffer = bufnr, remap = false }
	)
	vim.keymap.set(
		"n",
		"gR",
        require("telescope.builtin").lsp_references,
		{ desc = "See references", buffer = bufnr, remap = false }
	)
	vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = bufnr, remap = false })
	vim.keymap.set(
		"i",
		"<C-h>",
		vim.lsp.buf.signature_help,
		{ desc = "Show signuture info", buffer = bufnr, remap = false }
	)
end)

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "clangd", "rust_analyzer", "pyright", "tsserver" }
for _, thatLsp in ipairs(servers) do
	lspconf[thatLsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- luasnip setup
local luasnip = require("luasnip")

-- nvim-cmp setup
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp_mappings,
	sources = {
		{ name = "buffer" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
require("luasnip.loaders.from_vscode").lazy_load()

lsp.set_sign_icons({
	error = "✘ ",
	warn = " ",
	hint = "⚑ ",
	info = "» ",
})

lsp.setup()
