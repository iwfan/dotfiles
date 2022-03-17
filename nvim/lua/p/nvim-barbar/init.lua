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
map_cmd("n|<M-w>", "BufferClose")

map_cmd("n|\\<Tab>", "BufferPin")
map_cmd("n|<leader><Tab>", "BufferPick")
map_cmd("n|<bs><Tab>", "BufferClose")
map_cmd("n|[<Tab>", "BufferMovePrevious")
map_cmd("n|]<Tab>", "BufferMoveNext")

map_cmd("n|[b", "BufferPrevious")
map_cmd("n|]b", "BufferNext")
map_cmd("n|[B", "BufferMovePrevious")
map_cmd("n|]B", "BufferMoveNext")
map_cmd("n|\\b", "BufferPin")
map_cmd("n|<bs>b", "BufferClose")

map_cmd("n|[f", "BufferPrevious")
map_cmd("n|]f", "BufferNext")
map_cmd("n|[F", "BufferMovePrevious")
map_cmd("n|]F", "BufferMoveNext")
map_cmd("n|\\f", "BufferPin")
map_cmd("n|<bs>f", "BufferClose")

local function hi(name, fg, bg, attr)
    vim.cmd("hi! clear " .. name)

    if attr ~= nil then
        vim.highlight.create(name, { guifg = fg, guibg = bg, gui = attr }, true)
    elseif fg ~= nil and bg ~= nil then
        vim.highlight.create(name, { guifg = fg, guibg = bg }, true)
    end
end

hi("BufferCurrent", "#d4be98", "#504945", "bold")
hi("BufferCurrentIndex", "#d8a657", "#504945")
hi("BufferCurrentMod", "#d8a657", "#504945")
hi("BufferCurrentSign", "#7daea3", "#504945")
hi("BufferCurrentTarget", "#ea6962", "#504945", "bold")
hi("BufferVisible", "#ddc7a1", "#504945")
hi("BufferVisibleIndex", "#d8a657", "#504945")
hi("BufferVisibleMod", "#d8a657", "#504945")
hi("BufferVisibleSign", "#d8a657", "#504945")
hi("BufferVisibleTarget", "red", "#504945", "bold")
hi("BufferInactive", "#a89984", "#32302f")
hi "BufferInactiveIndex"
hi "BufferInactiveMod"
hi "BufferInactiveSign"
hi "BufferInactiveTarget"
hi "BufferCurrentIcon"
hi "BufferVisibleIcon"
hi "BufferInactiveIcon"
