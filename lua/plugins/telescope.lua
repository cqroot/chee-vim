return {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
        local actions = require("telescope.actions")

        require("telescope").setup({
            defaults = {
                layout_config = {
                    horizontal = {
                        height = 0.99,
                        width = 0.99,
                    },
                },
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                    },
                },
            },
        })
    end,
}
