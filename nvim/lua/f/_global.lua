-- inspect stuff
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print " === "
    print(unpack(objects))
    print " === "
end

function _G.searching_google(keyword)
    vim.fn.system { "open", "https://google.com/search?q=" .. keyword }
end

function _G.searching_deepl(keyword)
    vim.fn.system { "open", "https://deepl.com/zh/translator#en/zh/" .. keyword }
end

_G.FONT_ICON = {
    error = " ",
    warn = " ",
    info = " ",
    hint = " ",
    branch = "",
    modifiy = " ",
    add = " ",
    deleted = " ",
    merge = " ",
    renamed = " ",
    unknown = " ",
    ignored = " ",
    close = " ",
    edit = "",
    line = "│",
    line1 = "⏽",
    gear = " ",
    light = "",
    check = "﫠",
    indent = " ",
    unix = "",
    dos = "",
    mac = "",
}
