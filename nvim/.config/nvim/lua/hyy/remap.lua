vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
