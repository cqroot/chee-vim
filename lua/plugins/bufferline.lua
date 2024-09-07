return {
    "akinsho/bufferline.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
        local opts = { noremap = true, silent = true }
        vim.keymap.set({ "n", "v" }, "J", "<cmd>BufferLineCyclePrev<cr>", opts)
        vim.keymap.set({ "n", "v" }, "K", "<cmd>BufferLineCycleNext<cr>", opts)
        vim.keymap.set({ "n" }, "<leader>J", "<cmd>BufferLineMovePrev<cr>", opts)
        vim.keymap.set({ "n" }, "<leader>K", "<cmd>BufferLineMoveNext<cr>", opts)
        vim.keymap.set({ "n", "v" }, "<M-w>", "<cmd>bp|bd #<cr>", opts)

        require("bufferline").setup({
            options = {
                offsets = { { filetype = "neo-tree", text = " ", padding = 0 } },
                show_buffer_close_icons = false,
                show_close_icon = false,
                indicator = {
                    icon = "▎", -- this should be omitted if indicator style is not 'icon'
                    style = "icon",
                },
                separator_style = "thick",
            },
        })
    end,
}
