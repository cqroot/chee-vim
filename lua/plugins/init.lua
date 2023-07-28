local M = {}

local function init_lazy()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
end

function M.load()
    init_lazy()

    local plugins = {
        -- {
        --     "mcchrish/zenbones.nvim",
        --     config = function()
        --         vim.g.zenbones_compat = 1
        --     end,
        -- },
        -- {
        --     "Shatur/neovim-ayu",
        -- },
        -- {
        --     "Mofiqul/vscode.nvim",
        -- },
        {
            "navarasu/onedark.nvim",
            config = function()
                require("onedark").setup({
                    style = "darker",
                    -- style = "cool",
                    -- style = "warmer",
                    -- dark, darker, cool, deep, warm, warmer, light
                })
            end,
        },

        -- Panels
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
            },
            cmd = "Neotree",
            config = function()
                require("plugins.neo-tree").load()
            end,
        },
        {
            -- "simrat39/symbols-outline.nvim",
            "cqroot/symbols-outline-mdnum.nvim",
            cmd = "SymbolsOutline",
            config = function()
                require("plugins.symbols-outline").load()
            end,
        },
        {
            "nvim-telescope/telescope.nvim",
            dependencies = { { "nvim-lua/plenary.nvim" } },
            config = function()
                require("plugins.telescope").load()
            end,
        },

        -- Appearance
        {
            "nvim-lualine/lualine.nvim",
            config = function()
                require("plugins.lualine").load()
            end,
        },
        {
            "akinsho/bufferline.nvim",
            dependencies = "kyazdani42/nvim-web-devicons",
            config = function()
                require("plugins.bufferline").load()
            end,
        },
        {
            "chrisbra/Colorizer",
            init = function()
                vim.g.colorizer_auto_filetype = "css,html,i3config"
            end,
        },

        {
            "jose-elias-alvarez/null-ls.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                require("plugins.null-ls").load()
            end,
        },
        {
            "numToStr/Comment.nvim",
            config = function()
                require("plugins.comment").load()
            end,
        },

        -- ************************************************************************
        -- *  Git                                                                 *
        -- ************************************************************************
        {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("plugins.gitsigns").load()
            end,
        },
        { "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },

        -- ************************************************************************
        -- *  Completion                                                          *
        -- ************************************************************************
        { "neovim/nvim-lspconfig" }, -- Configurations for Nvim LSP
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "hrsh7th/nvim-cmp" },
        { "onsails/lspkind.nvim" },

        -- For luasnip users.
        { "L3MON4D3/LuaSnip" },
        { "saadparwaiz1/cmp_luasnip" },
        { "rafamadriz/friendly-snippets" },

        {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup({})
            end,
        },

        -- ************************************************************************
        -- *  Terminal                                                            *
        -- ************************************************************************
        {
            "akinsho/toggleterm.nvim",
            version = "*",
            config = function()
                require("plugins.toggleterm").load()
            end,
        },

        -- ************************************************************************
        -- *  Others                                                              *
        -- ************************************************************************
        {
            "ggandor/leap.nvim",
            config = function()
                -- require("leap").add_default_mappings()
                vim.keymap.set("n", "f", "<Plug>(leap-forward-to)")
                vim.keymap.set("n", "F", "<Plug>(leap-backward-to)")
            end,
        },
    }

    if vim.g.keenvim_enable_treesitter == 1 then
        table.insert(plugins, {
            "nvim-treesitter/nvim-treesitter",
            build = function()
                local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
                ts_update()
            end,
            config = function()
                require("plugins.treesitter").load()
            end,
        })
    end

    if vim.g.keenvim_enable_markdown == 1 then
        table.insert(plugins, {
            "preservim/vim-markdown",
            ft = "markdown",
            dependencies = {
                "godlygeek/tabular",
            },
            config = function()
                vim.g.vim_markdown_folding_disabled = 1
                -- vim.g.vim_markdown_folding_style_pythonic = 1
                vim.g.vim_markdown_math = 1
                vim.g.vim_markdown_auto_insert_bullets = 0
            end,
        })
        table.insert(plugins, {
            "iamcco/markdown-preview.nvim",
            build = "cd app && yarn install",
            cmd = "MarkdownPreview",
            ft = "markdown",
            config = function()
                require("plugins.markdown-preview").load()
            end,
            init = function()
                vim.g.mkdp_filetypes = { "markdown" }
            end,
        })
        table.insert(plugins, {
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
    end

    if vim.g.keenvim_enable_navigator == 1 then
        table.insert(plugins, {
            "numToStr/Navigator.nvim",
            config = function()
                require("Navigator").setup()
            end,
        })
    end

    require("lazy").setup(plugins)
end

return M
