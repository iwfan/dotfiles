require("bufferline").setup {
    options = {
        modified_icon = font_icon.edit,
        close_icon = font_icon.close,
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        separator_style = "thin",
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        diagnostics = "nvim_lsp",
    },
}

map_cmd("n|qb", "BufferLinePick")
map_cmd("n|<bs>b", "Bdelete!")
map_cmd("n|b<", "BufferLineMovePrev")
map_cmd("n|b>", "BufferLineMoveNext")
