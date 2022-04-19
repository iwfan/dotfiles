require("bufferline").setup {
    options = {
        themable = true,
        close_command = nil,
        right_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        show_buffer_close_icons = false,
        modified_icon = "●",
        left_trunc_marker = "",
        right_trunc_marker = "",
        show_close_icon = false,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        always_show_bufferline = true,
    },
}

map_cmd("n|[b", "BufferLineCyclePrev")
map_cmd("n|]b", "BufferLineCycleNext")
map_cmd("n|[B", "BufferLineMovePrev")
map_cmd("n|]B", "BufferLineMoveNext")
map_cmd("n|\\b", "BufferLinePick")
map_cmd("n|<bs>b", "Bdelete!")

map_cmd("n|[f", "BufferLineCyclePrev")
map_cmd("n|]f", "BufferLineCycleNext")
map_cmd("n|[F", "BufferLineMovePrev")
map_cmd("n|]F", "BufferLineMoveNext")
map_cmd("n|\\f", "BufferLinePick")
map_cmd("n|<bs>f", "Bdelete!")
