require("bufferline").setup {
    options = {
        modified_icon = font_icon.edit,
        close_icon = font_icon.close,
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        diagnostics = "nvim_lsp",
    },
}

map_cmd("n|b<", "BufferLineMovePrev")
map_cmd("n|b>", "BufferLineMoveNext")
map_cmd("n|\b", "BufferLinePick")
map_cmd("n|<bs>b", "Bdelete!")
