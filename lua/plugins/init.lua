local M = {}

function M.load()
	-- This file can be loaded by calling `lua require('plugins')` from your init.vim

	-- Only required if you have packer configured as `opt`
	vim.cmd([[packadd packer.nvim]])

	return require("packer").startup(function(use)
		-- Packer can manage itself
		use("wbthomason/packer.nvim")

		use({ "dracula/vim", as = "dracula" })

		use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			requires = {
				"nvim-lua/plenary.nvim",
				"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
			},
			cmd = "NeoTreeShowToggle",
			config = function()
				-- Unless you are still migrating, remove the deprecated commands from v1.x
				vim.g.neo_tree_remove_legacy_commands = 1
				require("plugins.neo-tree").load()
			end,
		})
		use({
			"simrat39/symbols-outline.nvim",
			cmd = "SymbolsOutline",
			config = function()
				require("plugins.symbols-outline").load()
			end,
		})
		use({
			"stevearc/aerial.nvim",
			cmd = "AerialToggle",
			config = function()
				require("aerial").setup()
			end,
		})
		use({
			"hoob3rt/lualine.nvim",
			config = function()
				require("plugins.lualine").load()
			end,
		})
		use({
			"akinsho/bufferline.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("plugins.bufferline").load()
			end,
		})

		use({ "sbdchd/neoformat", cmd = "Neoformat" })
		use({
			"preservim/nerdcommenter",
			config = function()
				require("plugins.nerdcommenter").load()
			end,
		})

		-- ************************************************************************
		-- *  Git                                                                 *
		-- ************************************************************************
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("plugins.gitsigns").load()
			end,
		})

		-- ************************************************************************
		-- *  Completion                                                          *
		-- ************************************************************************
		use({ "neovim/nvim-lspconfig" }) -- Configurations for Nvim LSP
		use({ "hrsh7th/cmp-nvim-lsp" })
		use({ "hrsh7th/cmp-buffer" })
		use({ "hrsh7th/cmp-path" })
		use({ "hrsh7th/cmp-cmdline" })
		use({ "hrsh7th/nvim-cmp" })

		-- For luasnip users.
		use({ "L3MON4D3/LuaSnip" })
		use({ "saadparwaiz1/cmp_luasnip" })
		use({ "rafamadriz/friendly-snippets" })

		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})

		-- ************************************************************************
		-- *  Markdown                                                            *
		-- ************************************************************************
		use({
			"iamcco/markdown-preview.nvim",
			run = "cd app && yarn install",
			cmd = "MarkdownPreview",
			ft = "markdown",
			config = function()
				require("plugins.markdown-preview")
			end,
		})
		-- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
	end)
end

return M
