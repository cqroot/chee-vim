local M = {}

function M.load()
    local opts = { noremap = true, silent = true }
    vim.g.mapleader = ";"

    -- ************************************************************************
    -- * Navigation                                                           *
    -- ************************************************************************
    vim.keymap.set("n", "<M-h>", "<CMD>NavigatorLeft<CR>")
    vim.keymap.set("n", "<M-l>", "<CMD>NavigatorRight<CR>")
    vim.keymap.set("n", "<M-k>", "<CMD>NavigatorUp<CR>")
    vim.keymap.set("n", "<M-j>", "<CMD>NavigatorDown<CR>")
    vim.keymap.set("n", "<M-p>", "<CMD>NavigatorPrevious<CR>")

    -- ************************************************************************
    -- * Buffer                                                           *
    -- ************************************************************************
    -- vim.keymap.set({ "n", "v" }, "J", "<cmd>bp!<cr>", opts)
    -- vim.keymap.set({ "n", "v" }, "K", "<cmd>bn!<cr>", opts)

    vim.keymap.set({ "n", "v" }, "J", "<cmd>BufferLineCyclePrev<cr>", opts)
    vim.keymap.set({ "n", "v" }, "K", "<cmd>BufferLineCycleNext<cr>", opts)

    vim.keymap.set({ "n" }, "<leader>J", "<cmd>BufferLineMovePrev<cr>", opts)
    vim.keymap.set({ "n" }, "<leader>K", "<cmd>BufferLineMoveNext<cr>", opts)

    vim.keymap.set({ "n", "v" }, "<M-w>", "<cmd>bp|bd #<cr>", opts)

    vim.keymap.set({ "n", "v" }, "<M-a>", function()
        vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(client)
                return client.name == "null-ls"
            end,
        })
    end, opts)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, opts)
    -- vim.keymap.set({ "n", "v" }, "<C-_>", "<Plug>NERDCommenterToggle", opts)

    -- ************************************************************************
    -- * Views                                                                *
    -- ************************************************************************
    vim.keymap.set({ "n", "v" }, "<C-k>f", "<cmd>Neotree toggle<cr>", opts)
    -- vim.keymap.set({ "n", "v" }, "<leader>q", "<cmd>Neotree toggle<cr>", opts)
    vim.keymap.set({ "n", "v" }, "<C-k>w", "<cmd>SymbolsOutline<cr>", opts)
    vim.keymap.set({ "n", "v" }, "<C-k>d", "<cmd>Gitsigns diffthis<cr>", opts)
    -- vim.keymap.set({ "n", "v" }, "<leader>w", "<cmd>AerialToggle<cr>", opts)

    -- ************************************************************************
    -- * Others                                                               *
    -- ************************************************************************
    vim.keymap.set({ "n", "v" }, "<leader>s", require("telescope.builtin").find_files, opts)
    vim.keymap.set({ "n", "v" }, "<leader>f", require("telescope.builtin").live_grep, opts)
    vim.keymap.set({ "n", "v" }, "<leader>.", "<cmd>luafile $MYVIMRC<cr>", opts)
end

return M
