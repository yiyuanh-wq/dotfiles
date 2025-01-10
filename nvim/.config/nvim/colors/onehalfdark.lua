-- 1. Define the color palette
local colors = {
  black   = "#282c34",
  red     = "#e06c75",
  green   = "#98c379",
  yellow  = "#e5c07b",
  blue    = "#61afef",
  purple  = "#c678dd",
  cyan    = "#56b6c2",
  white   = "#dcdfe4",

  comment_fg  = "#5c6370",
  gutter_bg   = "#282c34",
  gutter_fg   = "#919baa",
  non_text    = "#373C45",

  cursor_line = "#313640",
  color_col   = "#313640",

  selection   = "#474e5d",
  vertsplit   = "#313640",
}

-- For convenience
colors.fg = colors.white
colors.bg = colors.black

-- 2. Set Neovim to recognize it as a dark background
vim.opt.background = "dark"

-- 3. Let Neovim know the name of our colorscheme
vim.g.colors_name = "onehalfdark"

-- 4. (Optional) Set terminal colors
vim.g.terminal_color_0  = colors.black
vim.g.terminal_color_1  = colors.red
vim.g.terminal_color_2  = colors.green
vim.g.terminal_color_3  = colors.yellow
vim.g.terminal_color_4  = colors.blue
vim.g.terminal_color_5  = colors.purple
vim.g.terminal_color_6  = colors.cyan
vim.g.terminal_color_7  = colors.white
vim.g.terminal_color_8  = colors.black
vim.g.terminal_color_9  = colors.red
vim.g.terminal_color_10 = colors.green
vim.g.terminal_color_11 = colors.yellow
vim.g.terminal_color_12 = colors.blue
vim.g.terminal_color_13 = colors.purple
vim.g.terminal_color_14 = colors.cyan
vim.g.terminal_color_15 = colors.white

-- 5. Helper to set highlights quickly
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- 6. Define your highlight groups
hi("Normal",        { fg = colors.fg,   bg = colors.bg })
hi("Comment",       { fg = colors.comment_fg, italic = true })
hi("LineNr",        { fg = colors.gutter_fg, bg = colors.gutter_bg })
hi("CursorLineNr",  { fg = colors.fg,   bg = colors.gutter_bg, bold = true })
hi("CursorLine",    { bg = colors.cursor_line })
hi("ColorColumn",   { bg = colors.color_col })
hi("Visual",        { bg = colors.selection })
hi("Search",        { fg = colors.bg,   bg = colors.yellow })
hi("IncSearch",     { fg = colors.bg,   bg = colors.yellow, bold = true })

hi("Constant",      { fg = colors.cyan })
hi("String",        { fg = colors.green })
hi("Number",        { fg = colors.yellow })
hi("Boolean",       { fg = colors.yellow })
hi("Identifier",    { fg = colors.red })
hi("Function",      { fg = colors.blue })
hi("Statement",     { fg = colors.purple })
hi("Keyword",       { fg = colors.red })
hi("Type",          { fg = colors.yellow })
hi("Special",       { fg = colors.blue })
