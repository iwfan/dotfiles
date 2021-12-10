vim.g.bufferline = {
    animation = true,
    auto_hide = false,
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

local function hi(name, fg, bg, attr)
    vim.cmd("hi! clear " .. name)

    if attr ~= nil then
        vim.cmd("hi! " .. name .. " guifg=" .. fg .. " guibg=" .. bg .. " gui=" .. attr)
    elseif fg ~= nil and bg ~= nil then
        vim.cmd("hi! " .. name .. " guifg=" .. fg .. " guibg=" .. bg)
    end
end

hi("BufferCurrent", "#d4be98", "#504945", "bold")
hi("BufferCurrentIndex", "#d8a657", "#504945")
hi("BufferCurrentMod", "#d8a657", "#504945")
hi("BufferCurrentSign", "#d8a657", "#504945")
hi("BufferCurrentTarget", "#ea6962", "#504945", "bold")
hi "BufferVisible"
hi "BufferVisibleIndex"
hi "BufferVisibleMod"
hi "BufferVisibleSign"
hi "BufferVisibleTarget"
hi "BufferInactive"
hi "BufferInactiveIndex"
hi "BufferInactiveMod"
hi "BufferInactiveSign"
hi "BufferInactiveTarget"
hi "BufferCurrentIcon"
hi "BufferVisibleIcon"
hi "BufferInactiveIcon"
