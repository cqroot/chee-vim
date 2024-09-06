return {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    cmd = "MarkdownPreview",
    ft = "markdown",
    config = function()
        vim.g.mkdp_auto_close = 0
        vim.g.mkdp_browser = ""
    end,
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
}
