vim.g.bufferline = {
    animation = true,
    auto_hide = true,
    tabpages = true,
    closable = false,
    clickable = true,

    icons = true,
    icon_custom_colors = false,
    icon_separator_active = "▎",
    icon_separator_inactive = "▎",
    icon_close_tab = "",
    icon_close_tab_modified = "●",
    icon_pinned = "車",

    maximum_padding = 2,
    maximum_length = 30,

    semantic_letters = true,
    letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

    no_name_title = nil,
}

map_cmd("n|<M-{>", "BufferPrevious")
map_cmd("n|<M-}>", "BufferNext")
map_cmd("n|C<Tab>", "BufferPick")
map_cmd("n|<M-w>", "BufferClose")

map_cmd("n|[b", "BufferPrevious")
map_cmd("n|]b", "BufferNext")
map_cmd("n|[B", "BufferMovePrevious")
map_cmd("n|]B", "BufferMoveNext")
map_cmd("n|<leader>b", "BufferPick")
map_cmd("n|\\b", "BufferPin")
map_cmd("n|<bs>b", "BufferClose")
