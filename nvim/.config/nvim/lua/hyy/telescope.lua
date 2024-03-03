local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>sf", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", opts)
