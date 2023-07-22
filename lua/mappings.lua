local M = {}

function M.load()
    local opts = { noremap = true, silent = true }
    vim.g.mapleader = ";"

    -- ************************************************************************
    -- * Navigation                                                           *
    -- ************************************************************************
    vim.keymap.set("n", "<C-s>", "<CMD>w<CR>")
    vim.keymap.set("i", "<C-s>", "<CMD>w<CR>")
    vim.keymap.set("n", "<M-h>", "<CMD>NavigatorLeft<CR>")
    vim.keymap.set("n", "<M-l>", "<CMD>NavigatorRight<CR>")
    vim.keymap.set("n", "<M-k>", "<CMD>NavigatorUp<CR>")
    vim.keymap.set("n", "<M-j>", "<CMD>NavigatorDown<CR>")
    vim.keymap.set("n", "<M-p>", "<CMD>NavigatorPrevious<CR>")

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
        vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(client)
                return client.name == "null-ls"
            end,
        })
    end, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, opts)
    -- vim.keymap.set({ "n", "v" }, "<C-_>", "<Plug>NERDCommenterToggle", opts)

    -- ************************************************************************
    -- * Others                                                               *
    -- ************************************************************************
    vim.keymap.set({ "n", "v" }, "<leader>f", require("telescope.builtin").find_files, opts)
    vim.keymap.set({ "n", "v" }, "<leader>g", require("telescope.builtin").live_grep, opts)
    vim.keymap.set({ "n", "v" }, "<leader>b", require("telescope.builtin").buffers, opts)
    -- vim.keymap.set({ "n", "v" }, "<leader>h", require("telescope.builtin").help_tags, opts)
    vim.keymap.set({ "n", "v" }, "<leader>.", "<cmd>luafile $MYVIMRC<cr>", opts)

    vim.keymap.set({ "n", "v", "i", "t" }, "<M-cr>", "<cmd>ToggleTerm direction=float<cr>", opts)

    vim.keymap.set({ "n", "v" }, "<M-a>", show_menu, opts)
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
