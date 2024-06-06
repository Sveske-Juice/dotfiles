-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

    -- Overwrite nvim's builting UI select to use telescope
    use {'nvim-telescope/telescope-ui-select.nvim' }

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("ThePrimeagen/harpoon")
	use("sophacles/vim-processing")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Manual LSP's (for settings)
			{ "p00f/clangd_extensions.nvim" }, -- Clangd extra settings

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- Diagnostics etc.
	use({
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	})

	-- Mason pkg installer
	use({ "WhoIsSethDaniel/mason-tool-installer.nvim" })

	-- file tree
	use({
		"nvim-neo-tree/neo-tree.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})

	-- Awesome icons
	use("nvim-tree/nvim-web-devicons")

	-- File tabs
	-- use("akinsho/bufferline.nvim")
	use("lewis6991/gitsigns.nvim") -- dependency for git support in tabs

	-- Notifications
	use("rcarriga/nvim-notify")

	-- Comments
	use({ "numToStr/Comment.nvim" })

	-- Comment highlighting
	use({
		"folke/todo-comments.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- Zen mode
	use({ "folke/zen-mode.nvim" })

	-- Twilight (Focus code being edited, used with zen mode)
	use({ "folke/twilight.nvim" })

	-- Discord rich presence
	-- use {'andweeb/presence.nvim'}

	-- Greeter
	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	})

	-- Highligt words matching hovered word
	use({ "RRethy/vim-illuminate" })

	-- Lines under indents
	use({ "lukas-reineke/indent-blankline.nvim" })

	-- Keybind helper
	use({ "folke/which-key.nvim" })

	-- Async build jobs
	use({ "tpope/vim-dispatch" })

	-- Lsp progress UI
	use({ "j-hui/fidget.nvim", branch = "legacy" })

	-- Automatically create/delete corresponding bracket
	use("m4xshen/autoclose.nvim")

	-- Among other things show empty whitespace
	use({ "ntpeters/vim-better-whitespace" })

	-- Debugging
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })

	-- Formatting
	use({ "stevearc/conform.nvim" })

	-- LaTeX development
	use({ "lervag/vimtex" })
	use({ "KeitaNakamura/tex-conceal.vim" })

	-- Color Schemes
	use({ "rose-pine/neovim", as = "rose-pine" })
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "sainnhe/gruvbox-material" })
	use({ "nordtheme/vim", as = "nord" })
	use({ "kreeger/benlight", as = "twilight" })
	use({ "sainnhe/everforest" })
end)
