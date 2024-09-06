return {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = function()
        require("symbols-outline").setup({
            width = 20,
            autofold_depth = 1,
            keymaps = { -- These keymaps can be a string or a table for multiple keys
                close = { "q" },
            },
        })

        vim.cmd("autocmd BufEnter * if (winnr(\"$\") == 1 && &filetype == 'Outline') | q | endif")
    end,
}
