require("bufferline").setup {
  options = {
    show_buffer_icons = false,
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    modified_icon = "●",
    left_trunc_marker = "",
    right_trunc_marker = "",
    separator_style = "thin",
  },
}
