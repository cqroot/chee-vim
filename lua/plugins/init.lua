local M = {}

function M.load()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
        vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
    end
    vim.opt.rtp:prepend(lazypath)

    require("lazy").setup({
        -- {
        --     "mcchrish/zenbones.nvim",
        --     config = function()
        --         vim.g.zenbones_compat = 1
        --     end,
        --     lazy = true,
        -- },
        -- {
        --     "Shatur/neovim-ayu",
        --     lazy = true,
        -- },
        -- {
        --     "Mofiqul/vscode.nvim",
        --     lazy = true,
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
            -- lazy = true,
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
            "stevearc/aerial.nvim",
            cmd = "AerialToggle",
            config = function()
                require("plugins.aerial").load()
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
            "preservim/nerdcommenter",
            config = function()
                require("plugins.nerdcommenter").load()
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
        {
            "nvim-treesitter/nvim-treesitter",
            build = function()
                local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
                ts_update()
            end,
            config = function()
                require("plugins.treesitter").load()
            end,
        },
        {
            "rcarriga/nvim-notify",
            config = function()
                require("notify").setup({
                    background_colour = "#000000",
                })
            end,
        },
        {
            "folke/noice.nvim",
            config = function()
                require("noice").setup({
                    lsp = {
                        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                        override = {
                            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                            ["vim.lsp.util.stylize_markdown"] = true,
                            ["cmp.entry.get_documentation"] = true,
                        },
                    },
                    -- you can enable a preset for easier configuration
                    presets = {
                        bottom_search = true, -- use a classic bottom cmdline for search
                        command_palette = true, -- position the cmdline and popupmenu together
                        long_message_to_split = true, -- long messages will be sent to a split
                        inc_rename = false, -- enables an input dialog for inc-rename.nvim
                        lsp_doc_border = false, -- add a border to hover docs and signature help
                    },
                })
            end,
            dependencies = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                -- "rcarriga/nvim-notify",
            },
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

        -- ************************************************************************
        -- *  Completion                                                          *
        -- ************************************************************************
        { "neovim/nvim-lspconfig" }, -- Configurations for Nvim LSP
        { "hrsh7th/cmp-nvim-lsp" },
        -- { "hrsh7th/cmp-buffer" },
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
        -- *  Markdown                                                            *
        -- ************************************************************************
        {
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
        },
        {
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
        },
        {
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
        },

        -- ************************************************************************
        -- *  Others                                                              *
        -- ************************************************************************
        {
            "karb94/neoscroll.nvim",
            config = function()
                require("neoscroll").setup()
            end,
        },
        {
            "numToStr/Navigator.nvim",
            config = function()
                require("Navigator").setup()
            end,
        },
    })
end

return M
