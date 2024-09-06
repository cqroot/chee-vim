return {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },
    keys = {
        {
            "<M-F>",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            bash = { "shfmt" },
            sh = { "shfmt" },

            c = { "clang-format" },
            cmake = { "cmake_format" },

            go = { "gofumpt" },
            lua = { "stylua" },
            python = { "black" },

            json = { "prettier" },
            markdown = { "prettier" },
            toml = { "taplo" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        formatters = {
            shfmt = {
                prepend_args = { "-i", "4" },
            },
        },
    },
}
