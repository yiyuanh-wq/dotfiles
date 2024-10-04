return {
  {
    'marko-cerovac/material.nvim',
    priority = 1000,
    init = function()
      --Lua:
      vim.g.material_style = "oceanic"
      vim.cmd.colorscheme 'material'
    end,
  }
}
