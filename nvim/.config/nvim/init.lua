-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.opt.relativenumber = true
vim.opt.wrap = false
vim.cmd("colorscheme retrobox")

-- Use 4 spaces for each indentation
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Create the undodir if it doesn't exist
local undodir = vim.fn.stdpath("data") .. "/undodir"
-- Create directory if it doesn't exist
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end

-- Set undodir and enable persistent undo
vim.opt.undodir = undodir
vim.opt.undofile = true

require("config.lazy")
