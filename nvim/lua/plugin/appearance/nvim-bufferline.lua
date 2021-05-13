require "bufferline".setup {
  options = {
    modified_icon           = "",
    close_icon              = " ",
    max_name_length         = 14,
    max_prefix_length       = 13,
    tab_size                = 20,
    show_tab_indicators     = true,
    enforce_regular_tabs    = false,
    view                    = "multiwindow",
    separator_style         = "thin",
    mappings                = false,
    always_show_bufferline  = false,
    show_buffer_close_icons = false,
    diagnostics             = "nvim_lsp"
  },
}

map_cmd("n|<TAB>",     "BufferLineCycleNext")
map_cmd("n|<S-TAB>",   "BufferLineCyclePrev")
map_cmd("n|bl",        "BufferLineCycleNext")
map_cmd("n|bh",        "BufferLineCyclePrev")
map_cmd("n|b<",        "BufferLineMovePrev")
map_cmd("n|b>",        "BufferLineMoveNext")
map_cmd("n|gb",        "BufferLinePick")
map_cmd("n|<BS><TAB>", "Bdelete")
