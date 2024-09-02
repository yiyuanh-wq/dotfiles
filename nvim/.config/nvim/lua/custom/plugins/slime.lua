return {
  'jpalardy/vim-slime',
  init = function()
    vim.cmd [[let g:slime_target = "wezterm"]]
    vim.cmd [[let g:slime_default_config = {"pane_direction": "right"}]]
  end,
}
