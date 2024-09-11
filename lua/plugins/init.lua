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
        {
            "rebelot/kanagawa.nvim",
        },
        {
            "Mofiqul/vscode.nvim",
        },
        {
            "navarasu/onedark.nvim",
            config = function()
                require("onedark").setup({
                    -- style = "darker",
                    -- style = "cool",
                    style = "warmer",
                    -- dark, darker, cool, deep, warm, warmer, light
                })
            end,
        },

        -- Panels
        require("plugins.neo-tree"),
        require("plugins.outline"),
        require("plugins.aerial"),
        require("plugins.telescope"),

        -- Appearance
        require("plugins.lualine"),
        require("plugins.bufferline"),
        {
            "chrisbra/Colorizer",
            init = function()
                vim.g.colorizer_auto_filetype = "css,html,i3config"
            end,
        },

        require("plugins.conform"),
        require("plugins.comment"),

        -- ************************************************************************
        -- *  Git                                                                 *
        -- ************************************************************************
        require("plugins.gitsigns"),
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

        {
            "L3MON4D3/LuaSnip",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load({
                    paths = vim.fn.stdpath("config") .. "/snippets",
                })
            end,
        },
        { "saadparwaiz1/cmp_luasnip" },
        { "rafamadriz/friendly-snippets" },

        {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup({})
            end,
        },

        require("plugins.cscope_maps"),
        -- ************************************************************************
        -- *  Terminal                                                            *
        -- ************************************************************************
        require("plugins.toggleterm"),

        require("plugins.which-key"),
    }

    if vim.g.kcnc_enable_treesitter == 1 then
        table.insert(plugins, require("plugins.treesitter"))
    end

    if vim.g.kcnc_enable_markdown == 1 then
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
        table.insert(plugins, require("plugins.markdown-preview"))
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

    if vim.g.kcnc_enable_navigator == 1 then
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
