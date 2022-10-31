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
			"nvim-tree/nvim-tree.lua",
			requires = {
				"nvim-tree/nvim-web-devicons",
			},
			tag = "nightly", -- optional, updated every week. (see issue #1193)
		})
		use({
			"simrat39/symbols-outline.nvim",
			cmd = "SymbolsOutline",
			config = function()
				require("symbols-outline").setup()
			end,
		})
		use({ "hoob3rt/lualine.nvim" })
		use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })

		use({ "sbdchd/neoformat", cmd = "Neoformat" })
		use({ "preservim/nerdcommenter" })

		-- ************************************************************************
		-- *  Git                                                                 *
		-- ************************************************************************
		use({ "lewis6991/gitsigns.nvim" })

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
        use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview', ft = 'markdown' }
        -- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
	end)
end

return M
