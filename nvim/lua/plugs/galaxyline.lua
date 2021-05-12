local zephyr = require("zephyr")
local gl = require("galaxyline")
local condition = require("galaxyline.condition")
local gls = gl.section
gl.short_line_list = {"NvimTree", "vista", "dbui", "packer", "vista_kind", "terminal", "dashboard"}

local colors = vim.tbl_extend(
  "force",
  zephyr,
  {
    line_bg = "#353644",
    fg_green = "#65a380",
    darkblue = "#081633",
    purple = "#5d4d7a"
  }
)

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(gl.section.left, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(gl.section.right, component)
end

ins_left  {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.blue,
        i = colors.green,
        v = colors.red,
        [""] = colors.red,
        V = colors.red,
        c = colors.magenta,
        no = colors.blue,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange,
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.blue,
        ce = colors.blue,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.blue,
        t = colors.blue
      }
      vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
      return "▊ "
    end,
    highlight = {colors.blue, colors.line_bg, "bold"}
  }
}
gls.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.line_bg}
  }
}
gls.left[4] = {
  FileName = {
    provider = {"FileName"},
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.line_bg, "bold"}
  }
}

gls.left[5] = {
  ShowLspClient = {
    provider = "GetLspClient",
    condition = function()
      local tbl = {["dashboard"] = true, [""] = true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = " LSP:",
    highlight = {colors.yellow, colors.line_bg, "bold"}
  }
}

gls.left[6] = {
  BlankArea = {
    provider = function()
      return " "
    end,
    highlight = {colors.fg, colors.line_bg}
  }
}

gls.left[7] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = {colors.red, colors.line_bg}
  }
}
gls.left[8] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = {colors.yellow, colors.line_bg}
  }
}

gls.left[9] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    icon = "  ",
    highlight = {colors.cyan, colors.line_bg}
  }
}

gls.left[10] = {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    icon = "  ",
    highlight = {colors.blue, colors.line_bg}
  }
}

gls.left[11] = {
  LeftEnd = {
    provider = function()
      return " "
    end,
    separator = "",
    separator_highlight = {"NONE", colors.bg},
    highlight = {colors.bg, colors.bg}
  }
}

gls.right[1] = {
  FileEncode = {
    provider = "FileEncode",
    condition = condition.hide_in_width,
    separator = " ",
    separator_highlight = {"NONE", colors.bg},
    highlight = {colors.fg, colors.line_bg, "bold"}
  }
}

gls.right[2] = {
  FileFormat = {
    provider = "FileFormat",
    condition = condition.hide_in_width,
    separator = " ",
    separator_highlight = {"NONE", colors.line_bg},
    highlight = {colors.fg, colors.line_bg, "bold"}
  }
}

gls.right[3] = {
  GitIcon = {
    provider = function()
      -- return " "
      return " "
    end,
    condition = condition.check_git_workspace,
    separator = " ",
    separator_highlight = {"NONE", colors.line_bg},
    highlight = {colors.violet, colors.line_bg, "bold"}
  }
}

gls.right[4] = {
  GitBranch = {
    provider = "GitBranch",
    condition = condition.check_git_workspace,
    highlight = {colors.violet, colors.line_bg, "bold"}
  }
}

gls.right[5] = {
  BlankArea = {
    provider = function()
      return " "
    end,
    condition = condition.check_git_workspace,
    highlight = {colors.violet, colors.line_bg, "bold"}
  }
}

gls.right[6] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = {colors.green, colors.line_bg}
  }
}

gls.right[7] = {
  DiffModified = {
    provider = "DiffModified",
    condition = condition.hide_in_width,
    icon = " 柳",
    highlight = {colors.orange, colors.line_bg}
  }
}
gls.right[8] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = {colors.red, colors.line_bg}
  }
}

gls.right[9] = {
  LineInfo = {
    provider = "LineColumn",
    highlight = {colors.fg, colors.line_bg}
  }
}

gls.right[10] = {
  ScrollBar = {
    provider = "ScrollBar",
    highlight = {colors.blue, colors.purple}
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = "FileTypeName",
    separator = " ",
    separator_highlight = {"NONE", colors.bg},
    highlight = {colors.blue, colors.bg, "bold"}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider = "SFileName",
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.bg, "bold"}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = "BufferIcon",
    highlight = {colors.fg, colors.bg}
  }
}
