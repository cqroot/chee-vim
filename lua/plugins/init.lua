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
			cmd = "Neotree",
			config = function()
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
				require("plugins.aerial").load()
			end,
		})
		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
			config = function()
				require("plugins.telescope").load()
			end,
		})
		use({
			"nvim-lualine/lualine.nvim",
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

		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("plugins.null-ls").load()
			end,
		})
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
		-- use({ "hrsh7th/cmp-buffer" })
		use({ "hrsh7th/cmp-path" })
		use({ "hrsh7th/cmp-cmdline" })
		use({ "hrsh7th/nvim-cmp" })
		use({ "onsails/lspkind.nvim" })

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
				require("plugins.markdown-preview").load()
			end,
			setup = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
		})
		use({
			"dkarter/bullets.vim",
			ft = "markdown",
			config = function()
				vim.g.bullets_outline_levels = { "num", "num", "num", "num", "num", "num" }

				local mdgroup = vim.api.nvim_create_augroup("Markdown", {})
				vim.api.nvim_create_autocmd("FileType", {
					group = mdgroup,
					callback = function()
						vim.opt.shiftwidth = 2
					end,
				})
			end,
		})
		use({
			"preservim/vim-markdown",
			ft = "markdown",
			requires = {
				"godlygeek/tabular",
			},
			config = function()
				vim.g.vim_markdown_folding_disabled = 1
				-- vim.g.vim_markdown_folding_style_pythonic = 1
				vim.g.vim_markdown_math = 1
				vim.g.vim_markdown_auto_insert_bullets = 0
			end,
		})

		-- ************************************************************************
		-- *  Others                                                              *
		-- ************************************************************************
		use({
			"karb94/neoscroll.nvim",
			config = function()
				require("neoscroll").setup()
			end,
		})
	end)
end

return M
