function SetColorScheme(theme)
	vim.cmd.colorscheme(theme)
end

function MakeTransparent()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- MakeTransparent()
SetColorScheme("rose-pine")
