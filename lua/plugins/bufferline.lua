local M = {}

function M.load()
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
end

return M
