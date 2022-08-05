local statusline = require "galaxyline"
local condition = require "galaxyline.condition"

local colors = {
    bg = "#32302f",
    fg = "#282828",
    bg1 = "#504945",
    fg1 = "#ddc7a1",
    yellow = "#d8a657",
    cyan = "#89b482",
    oceanblue = "#45707a",
    green = "#a9b665",
    orange = "#e78a4e",
    violet = "#d3869b",
    magenta = "#c14a4a",
    white = "#a89984",
    skyblue = "#7daea3",
    blue = "#51afef",
    red = "#ea6962",
    grey = "#928374",
}

local function insert_left(component)
    table.insert(statusline.section.left, component)
end

local function insert_right(component)
    table.insert(statusline.section.right, component)
end

local function lsp()
    local msg = " "
    local priority_map = {
        bash = 1,
        tsserver = 1,
        sumneko_lua = 1,
        gopls = 1,
        graphql = 2,
        jsonls = 2,
        yamlls = 2,
        html = 2,
        cssls = 3,
        tailwindcss = 10,
        eslint = 10,
        emmet_ls = 10,
        cssmodules_ls = 10,
        ["null-ls"] = 10,
    }
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end
    local client_names = {}
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            table.insert(client_names, client.name)
        end
    end
    if next(client_names) == nil then
        return msg
    end
    table.sort(client_names, function(left, right)
        return priority_map[left] < priority_map[right]
    end)
    return " " .. client_names[1]
end

statusline.short_line_list = { "NvimTree", "vista", "dbui", "packer", "vista_kind", "terminal", "dashboard" }

insert_left {
    ViMode = {
        provider = function()
            return "    "
        end,
        highlight = { colors.grey },
        separator = "",
        separator_highlight = { colors.bg },
    },
}

insert_left {
    GitBranch = {
        provider = "GitBranch",
        icon = FONT_ICON.branch,
        condition = condition.check_git_workspace,
        highlight = { colors.white, colors.bg },
        separator = " ",
        separator_highlight = { colors.bg },
    },
}

insert_left {
    Blank = {
        provider = function()
            return ""
        end,
        separator = "",
        separator_highlight = { colors.bg },
    },
}

insert_left {
    FileIcon = {
        provider = "FileIcon",
        condition = condition.buffer_not_empty,
        highlight = { colors.white, colors.bg },
    },
}

insert_left {
    FileName = {
        provider = { "FileName" },
        condition = condition.buffer_not_empty,
        highlight = { colors.white, colors.bg },
        separator = " ",
        separator_highlight = { colors.bg },
    },
}

insert_left {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = FONT_ICON.error,
        highlight = { colors.red },
    },
}

insert_left {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = FONT_ICON.warn,
        highlight = { colors.yellow },
    },
}

insert_left {
    DiagnosticHint = {
        provider = "DiagnosticHint",
        icon = FONT_ICON.hint,
        highlight = { colors.cyan },
    },
}

insert_left {
    DiagnosticInfo = {
        provider = "DiagnosticInfo",
        icon = FONT_ICON.info,
        highlight = { colors.blue },
    },
}

insert_right {
    ShowLspClient = {
        provider = lsp,
        condition = condition.buffer_not_empty,
        highlight = { colors.green },
    },
}

insert_right {
    Tabstop = {
        provider = function()
            return "SPC:" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
        end,
        separator = " ",
        condition = condition.hide_in_width,
        highlight = { colors.grey },
    },
}

insert_right {
    FileEncode = {
        provider = function()
            local encode = vim.bo.fenc ~= "" and vim.bo.fenc or vim.o.enc
            return encode:upper()
        end,
        separator = " ",
        condition = condition.hide_in_width,
        highlight = { colors.grey },
    },
}

insert_right {
    FileFormat = {
        provider = function()
            local fileformat = vim.bo.fileformat
            if fileformat == "unix" then
                return "LF"
            else
                return "CRLF"
            end
        end,
        condition = condition.hide_in_width,
        separator = " ",
        highlight = { colors.grey },
    },
}

insert_right {
    LineInfo = {
        provider = function()
            local line = vim.fn.line "."
            local column = vim.fn.col "."
            return string.format("%3d:%2d", line, column)
        end,
        separator = " ",
        icon = "",
        condition = condition.hide_in_width,
        highlight = { colors.grey },
    },
}

insert_right {
    RightEnd = {
        provider = function()
            return "  "
        end,
        separator = " ",
        highlight = { colors.grey },
    },
}
