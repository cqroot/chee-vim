local M = {}

function M.load()
    local opts = { noremap = true, silent = true }
    vim.g.mapleader = ";"

    -- ************************************************************************
    -- * Navigation                                                           *
    -- ************************************************************************
    vim.keymap.set("n", "<C-s>", "<CMD>w<CR>")
    vim.keymap.set("i", "<C-s>", "<CMD>w<CR>")
    if vim.g.kcnc_enable_navigator == 1 then
        vim.keymap.set({ "n" }, "<M-h>", "<CMD>NavigatorLeft<CR>")
        vim.keymap.set({ "n" }, "<M-l>", "<CMD>NavigatorRight<CR>")
        vim.keymap.set({ "n" }, "<M-k>", "<CMD>NavigatorUp<CR>")
        vim.keymap.set({ "n" }, "<M-j>", "<CMD>NavigatorDown<CR>")
        vim.keymap.set({ "n" }, "<M-p>", "<CMD>NavigatorPrevious<CR>")
    else
        vim.api.nvim_set_keymap("n", "<M-h>", "<C-w>h", opts)
        vim.api.nvim_set_keymap("n", "<M-j>", "<C-w>j", opts)
        vim.api.nvim_set_keymap("n", "<M-k>", "<C-w>k", opts)
        vim.api.nvim_set_keymap("n", "<M-l>", "<C-w>l", opts)
    end

    -- ************************************************************************
    -- * Buffer                                                               *
    -- ************************************************************************
    vim.keymap.set({ "n", "v" }, "J", "<cmd>BufferLineCyclePrev<cr>", opts)
    vim.keymap.set({ "n", "v" }, "K", "<cmd>BufferLineCycleNext<cr>", opts)

    vim.keymap.set({ "n" }, "<leader>J", "<cmd>BufferLineMovePrev<cr>", opts)
    vim.keymap.set({ "n" }, "<leader>K", "<cmd>BufferLineMoveNext<cr>", opts)

    vim.keymap.set({ "n", "v" }, "<M-w>", "<cmd>bp|bd #<cr>", opts)

    -- ************************************************************************
    -- * LSPs                                                                 *
    -- ************************************************************************
    vim.keymap.set({ "n", "v" }, "<M-F>", function()
        require("conform").format({ async = true }, function(err)
            if not err then
                local mode = vim.api.nvim_get_mode().mode
                if vim.startswith(string.lower(mode), "v") then
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
                end
            end
        end)
    end, { desc = "Format code" })

    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, opts)
    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts = { buffer = ev.buf }
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "H", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
            vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set("n", "<leader>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<space>f", function()
                vim.lsp.buf.format({ async = true })
            end, opts)
        end,
    })

    -- ************************************************************************
    -- * Others                                                               *
    -- ************************************************************************
    -- vim.keymap.set({ "n", "v" }, "<leader>f", require("telescope.builtin").find_files, opts)
    vim.keymap.set({ "n", "v" }, "<C-p>", function()
        require("telescope.builtin").find_files({
            previewer = false,
            layout_strategy = "vertical",
            layout_config = {
                width = 0.5,
                height = 0.5,
            },
        })
    end, opts)
    vim.keymap.set({ "n", "v" }, "<leader>g", require("telescope.builtin").live_grep, opts)
    vim.keymap.set({ "n", "v" }, "<leader>b", require("telescope.builtin").buffers, opts)
    -- vim.keymap.set({ "n", "v" }, "<leader>h", require("telescope.builtin").help_tags, opts)
    vim.keymap.set({ "n", "v" }, "<leader>.", "<cmd>luafile $MYVIMRC<cr>", opts)

    vim.keymap.set({ "n", "v", "i", "t" }, "<M-cr>", "<cmd>ToggleTerm direction=float<cr>", opts)

    vim.keymap.set({ "n", "v" }, "<M-a>", show_menu, opts)

    vim.keymap.set({ "n" }, "mm", "<Plug>BookmarkToggle <Plug>BookmarkShowAll", opts)
end

local winid = -1

function show_menu()
    local Menu = require("nui.menu")
    local event = require("nui.utils.autocmd").event

    if winid ~= -1 then
        vim.api.nvim_win_close(winid, true)
        winid = -1
        return
    end

    local menu = Menu({
        position = "50%",
        size = {
            width = 25,
            height = 5,
        },
        border = {
            style = "rounded",
        },
        win_options = {
            winhighlight = "Normal:Normal,FloatBorder:Normal",
        },
    }, {
        lines = {
            Menu.item("Toggle Explorer"),
            Menu.item("Toggle Outline"),
            Menu.item("Git: Diff this"),
        },
        max_width = 20,
        keymap = {
            focus_next = { "j", "<Down>", "<Tab>" },
            focus_prev = { "k", "<Up>", "<S-Tab>" },
            close = { "<Esc>", "<C-c>" },
            submit = { "<CR>", "<Space>" },
        },
        on_close = function()
            winid = -1
        end,
        on_submit = function(item)
            if item.text == "Toggle Explorer" then
                vim.cmd({ cmd = "Neotree", args = { "toggle", "show" } })
            elseif item.text == "Toggle Outline" then
                vim.cmd({ cmd = "SymbolsOutline" })
            elseif item.text == "Git: Diff this" then
                require("gitsigns").diffthis()
            end
            winid = -1
        end,
    })

    -- mount the component
    menu:mount()
    winid = menu.winid
end

return M
