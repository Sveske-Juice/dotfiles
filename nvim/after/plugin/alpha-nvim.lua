local alpha_ok, alpha = pcall(require, "alpha")
if not alpha_ok then return end

local dashboard_ok, dashboard = pcall(require, "alpha.themes.dashboard")
if not dashboard_ok then return end

-- set highlights
vim.api.nvim_set_hl(0, "AlphaDashboard", {fg="#1D918B"})
dashboard.section.header.opts.hl = 'AlphaDashboard'
dashboard.section.footer.opts.hl = 'AlphaDashboard'


local function footer()
	local datetime_ok, datetime = pcall(os.date, " %H:%M (%D)")
	local version = vim.version()
	local nvim_verion = string.format("nvim v%d.%d.%d ", version.major, version.minor, version.patch )
	if not datetime_ok then
		return nvim_verion
	end
	return  nvim_verion  .. " | " .. datetime
end


-- Set header
dashboard.section.header.val = {
    ""
}


-- Set menu
local options = {}

dashboard.section.buttons.val = {
	dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>", options),
	dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>", options),
	dashboard.button("s", "s  Sessions", ":SessionManager load_session<CR>", options),
	dashboard.button("f", "🔎 Find file", ":Telescope find_files<CR>", options),
	dashboard.button("q", "  Quit NVIM", ":qa<CR>", options),
}

dashboard.section.footer.val = footer()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
