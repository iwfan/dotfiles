local lsp = require "feline.providers.lsp"
local vi_mode_utils = require "feline.providers.vi_mode"

local force_inactive = {
    filetypes = {
        "coc-explorer",
        "NvimTree",
        "dbui",
        "packer",
        "startify",
        "fugitive",
        "fugitiveblame",
        "vista",
        "vista_kind",
        "dashboard",
    },
    buftypes = { "terminal" },
    bufnames = {},
}

local components = {
    active = { {}, {}, {} },
    inactive = { {}, {} },
}

local colors = {
    bg = "#32302f",
    bg1 = "#282828",
    black = "#282828",
    yellow = "#d8a657",
    cyan = "#89b482",
    oceanblue = "#45707a",
    green = "#a9b665",
    orange = "#e78a4e",
    violet = "#d3869b",
    magenta = "#c14a4a",
    white = "#a89984",
    fg = "#a89984",
    skyblue = "#7daea3",
    red = "#ea6962",
}

local vi_mode_colors = {
    NORMAL = "green",
    OP = "green",
    INSERT = "red",
    VISUAL = "skyblue",
    BLOCK = "skyblue",
    REPLACE = "violet",
    ["V-REPLACE"] = "violet",
    ENTER = "cyan",
    MORE = "cyan",
    SELECT = "orange",
    COMMAND = "green",
    SHELL = "green",
    TERM = "green",
    NONE = "yellow",
}

local function ins_left(component)
    table.insert(components.active[1], component)
end

local function ins_right(component)
    table.insert(components.active[3], component)
end

-- vi-mode
ins_left {
    provider = "▊",
    hl = function()
        local val = {}

        val.fg = vi_mode_utils.get_mode_color()
        val.style = "bold"

        return val
    end,
    right_sep = " ",
}

ins_left {
    provider = "file_info",
    hl = {
        fg = "white",
        bg = "bg",
    },
    right_sep = "",
}

-- diagnosticErrors
ins_left {
    provider = "diagnostic_errors",
    enabled = function()
        return lsp.diagnostics_exist "Error"
    end,
    hl = {
        fg = "red",
    },
}
-- diagnosticWarn
ins_left {
    provider = "diagnostic_warnings",
    enabled = function()
        return lsp.diagnostics_exist "Warning"
    end,
    hl = {
        fg = "yellow",
    },
}
-- diagnosticHint
ins_left {
    provider = "diagnostic_hints",
    enabled = function()
        return lsp.diagnostics_exist "Hint"
    end,
    right_sep = " ",
    hl = {
        fg = "cyan",
    },
}
-- diagnosticInfo
ins_left {
    provider = "diagnostic_info",
    enabled = function()
        return lsp.diagnostics_exist "Information"
    end,
    right_sep = " ",
    hl = {
        fg = "skyblue",
    },
}

-- gitBranch
ins_right {
    provider = function()
        local git_branch = vim.g.coc_git_status
        return git_branch or ""
    end,
    hl = {
        fg = "yellow",
        style = "bold",
    },
    left_sep = " ",
}

local buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
end

-- diffAdd
ins_right {
    provider = function()
        local git_status = vim.b.coc_git_status
        git_status = git_status and string.match(git_status, "+%d+") or ""
        return string.gsub(git_status, "+", " ") or ""
    end,
    enabled = buffer_not_empty,
    hl = {
        fg = "green",
    },
    left_sep = " ",
}
-- diffModfified
ins_right {
    provider = function()
        local git_status = vim.b.coc_git_status
        git_status = git_status and string.match(git_status, "~%d+") or ""
        return string.gsub(git_status, "~", " ") or ""
    end,
    enabled = buffer_not_empty,
    hl = {
        fg = "orange",
    },
    left_sep = " ",
}
-- diffRemove
ins_right {
    provider = function()
        local git_status = vim.b.coc_git_status
        git_status = git_status and string.match(git_status, "-%d+") or ""
        return string.gsub(git_status, "-", " ") or ""
    end,
    enabled = buffer_not_empty,
    hl = {
        fg = "red",
    },
    left_sep = " ",
}

ins_right {
    provider = function()
        return vim.g.coc_status or ""
    end,
    enabled = buffer_not_empty,
    left_sep = " ",
}

-- lineInfo
ins_right {
    provider = "position",
    left_sep = " ",
    right_sep = " ",
}
-- tabstop
ins_right {
    provider = function()
        return "Spaces:" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end,
    right_sep = " ",
}
-- fileEncode
ins_right {
    provider = "file_encoding",
    hl = {
        fg = "white",
        bg = "bg",
    },
    right_sep = " ",
}
-- EOL
ins_right {
    provider = function()
        local fileformat = vim.bo.fileformat
        if fileformat == "unix" then
            return "LF"
        else
            return "CRLF"
        end
    end,
    right_sep = " ",
}

-- fileIcon
ins_right {
    provider = function()
        local filename = vim.fn.expand "%:t"
        local extension = vim.fn.expand "%:e"
        local icon = require("nvim-web-devicons").get_icon(filename, extension)
        if icon == nil then
            icon = ""
        end
        return icon
    end,
    hl = function()
        local val = {}
        local filename = vim.fn.expand "%:t"
        local extension = vim.fn.expand "%:e"
        local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
        if icon ~= nil then
            val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
        else
            val.fg = "white"
        end
        val.bg = "bg"
        val.style = "bold"
        return val
    end,
    right_sep = " ",
}
-- fileType
ins_right {
    provider = "file_type",
    hl = function()
        local val = {}
        local filename = vim.fn.expand "%:t"
        local extension = vim.fn.expand "%:e"
        local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
        if icon ~= nil then
            val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
        else
            val.fg = "white"
        end
        val.bg = "bg"
        return val
    end,
    right_sep = " ",
}
-- linePercent
ins_right {
    provider = "line_percentage",
    hl = {
        fg = "white",
        bg = "bg",
    },
    right_sep = " ",
}

-- INACTIVE

-- fileType
table.insert(components.inactive[1], {
    provider = "file_type",
    hl = {
        fg = "black",
        bg = "cyan",
        style = "bold",
    },
    left_sep = {
        str = " ",
        hl = {
            fg = "NONE",
            bg = "cyan",
        },
    },
    right_sep = {
        {
            str = " ",
            hl = {
                fg = "NONE",
                bg = "cyan",
            },
        },
        " ",
    },
})

table.insert(components.inactive[1], {
    provider = "file_info",
    enabled = function(winid)
        return vim.api.nvim_win_get_width(winid) > 80
    end,
    hl = {
        fg = "white",
        bg = "bg",
    },
    right_sep = "",
})

require("feline").setup {
    colors = colors,
    vi_mode_colors = vi_mode_colors,
    components = components,
    force_inactive = force_inactive,
}
