return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function(_, opts)
    require('oil').setup(opts)
    vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
  end
}
