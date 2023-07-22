local M = {}

-- local border_opts =
--     { border = "single", winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None" }

function M.load()
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    -- Set up nvim-cmp.
    local cmp = require("cmp")

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        preselect = cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ["<C-j>"] = cmp.mapping(function(fallback)
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end),
            ["<C-k>"] = cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expandable() then
                    luasnip.expand({})
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            -- { name = "vsnip" }, -- For vsnip users.
            { name = "luasnip" }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
        }, {
            -- { name = "buffer" },
        }),
        formatting = {
            format = lspkind.cmp_format({
                mode = "symbol",
                symbol_map = {
                    -- NONE = "",
                    -- Array = "",
                    -- Boolean = "⊨",
                    -- Class = "",
                    -- Constructor = "",
                    -- Key = "",
                    -- Namespace = "",
                    -- Null = "NULL",
                    -- Number = "#",
                    -- Object = "⦿",
                    -- Package = "",
                    -- Property = "",
                    -- Reference = "",
                    -- Snippet = "",
                    -- String = "𝓐",
                    -- TypeParameter = "",
                    -- Unit = "",

                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = "",
                    Field = "ﰠ",
                    Variable = "",
                    Class = "ﴯ",
                    Interface = "",
                    Module = "",
                    Property = "ﰠ",
                    Unit = "塞",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "פּ",
                    Event = "",
                    Operator = "",
                    TypeParameter = "",
                },
            }),
        },
    })

    -- -- Set configuration for specific filetype.
    -- cmp.setup.filetype("gitcommit", {
    --     sources = cmp.config.sources({
    --         { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
    --     }, {
    --         { name = "buffer" },
    --     }),
    -- })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    })

    require("luasnip.loaders.from_vscode").lazy_load()
    require("plugins.lspconfig").load()
end

return M
