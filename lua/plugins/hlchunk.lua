return {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        indent = { enable = false },
        blank = { enable = false },
        line_num = { enable = false },
        chunk = {
            enable = true,
            notify = false,
            use_treesitter = true,
            exclude_filetypes = {
                help = true,
                markdown = true,
            },
        },
    },
}
