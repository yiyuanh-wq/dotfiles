return {
  "yiyuan-he/mage.nvim",
  lazy = false, -- load immediately
  priority = 1000, -- make it's loaded before other colorschemes
  opts = {},
  config = function ()
    vim.cmd('colorscheme mage')
  end
}
