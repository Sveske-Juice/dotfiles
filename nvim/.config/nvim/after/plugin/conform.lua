require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "usort", "black" }, -- Run sequentially
		javascript = { { "prettierd", "prettier" } }, -- Run first if exists
		cpp = { "clang_format" },
		json = { "jq" },
		html = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		cs = { "csharpier" },
	},
})

-- Format keybinding
vim.keymap.set("n", "<leader>f", function()
	require("conform").format()
end, { desc = "Format Buffer" })
