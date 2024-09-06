return {
    "akinsho/bufferline.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
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
