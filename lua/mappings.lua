local M = {}

function M.load()
    local opts = { noremap = true, silent = true }

    -- ************************************************************************
    -- * Navigation                                                           *
    -- ************************************************************************
    vim.keymap.set({ "n", "i" }, "<C-s>", "<CMD>w<CR>")
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
    -- * LSPs                                                                 *
    -- ************************************************************************
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

    vim.keymap.set({ "n", "v", "i", "t" }, "<M-cr>", "<cmd>ToggleTerm direction=float<cr>", opts)

    require("which-key").add({
        { "<leader>sd", "<CMD>Gitsigns diffthis<CR>", desc = "Git diff" },

        -- Telescope
        {
            "<C-p>",
            function()
                require("telescope.builtin").find_files({
                    previewer = false,
                    layout_strategy = "vertical",
                    layout_config = {
                        width = 0.5,
                        height = 0.5,
                    },
                })
            end,
            desc = "Telescope find_files",
        },
        { "<leader>tg", require("telescope.builtin").live_grep, desc = "Telescope live_grep" },
        { "<leader>tb", require("telescope.builtin").buffers, desc = "Telescope buffers" },
        { "<leader>tt", require("telescope.builtin").tags, desc = "Telescope tags" },
    })
end

return M
