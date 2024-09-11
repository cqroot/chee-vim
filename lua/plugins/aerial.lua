return {
    "stevearc/aerial.nvim",
    keys = {
        { "<leader>sa", "<CMD>AerialToggle right<CR>", mode = { "n", "v" }, desc = "Toggle Outline" },
    },
    opts = {},
    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
}
