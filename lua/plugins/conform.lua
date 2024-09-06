require("conform").setup({
    formatters_by_ft = {
        bash = { "shfmt" },
        c = { "clang-format" },
        cmake = { "cmake_format" },
        go = { "gofumpt" },
        json = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        python = { "black" },
        toml = { "taplo" },
    },
})
