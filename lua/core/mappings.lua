local M = {}

function M.load()
	local opts = { noremap = true, silent = true }
    vim.g.mapleader = ";"

	-- ************************************************************************
	-- * Navigation                                                           *
	-- ************************************************************************
	vim.keymap.set("n", "<M-h>", "<CMD>NavigatorLeft<CR>")
	vim.keymap.set("n", "<M-l>", "<CMD>NavigatorRight<CR>")
	vim.keymap.set("n", "<M-k>", "<CMD>NavigatorUp<CR>")
	vim.keymap.set("n", "<M-j>", "<CMD>NavigatorDown<CR>")
	vim.keymap.set("n", "<M-p>", "<CMD>NavigatorPrevious<CR>")

	-- ************************************************************************
	-- * Buffer                                                           *
	-- ************************************************************************
	vim.keymap.set({ "n", "v" }, "J", "<cmd>bp|bd #<cr>", opts)
	vim.keymap.set({ "n", "v" }, "K", "<cmd>bp!<cr>", opts)
	vim.keymap.set({ "n", "v" }, "<M-w>", "<cmd>bn!<cr>", opts)
	vim.keymap.set({ "n", "v" }, "<C-_>", "<Plug>NERDCommenterToggle", opts)
	vim.keymap.set({ "n", "v" }, "<leader>w", function()
		vim.lsp.buf.format()
	end, opts)

	-- ************************************************************************
	-- * Others                                                               *
	-- ************************************************************************
	vim.keymap.set({ "n", "v" }, "<leader>t", "<cmd>Neotree toggle<cr>", opts)
	vim.keymap.set({ "n", "v" }, "<leader>a", "<cmd>AerialToggle<cr>", opts)
    vim.keymap.set({ "n", "v" }, "<leader>s", require("telescope.builtin").find_files, opts)
    vim.keymap.set({ "n", "v" }, "<leader>f", require("telescope.builtin").live_grep, opts)
    vim.keymap.set({ "n", "v" }, "<leader>.", "<cmd>luafile $MYVIMRC<cr>", opts)
end

return M
