local zephyr = {
  base0      = '#1B2229';
  base1      = '#1c1f24';
  base2      = '#202328';
  base3      = '#23272e';
  base4      = '#3f444a';
  base5      = '#5B6268';
  base6      = '#73797e';
  base7      = '#9ca0a4';
  base8      = '#b1b1b1';

  bg = '#282a36';
  bg1 = '#504945';
  bg_popup = '#3E4556';
  bg_highlight  = '#2E323C';
  bg_visual = '#b3deef';

  fg = '#bbc2cf';
  fg_alt  = '#5B6268';

  red = '#e95678';

  redwine = '#d16d9e';
  orange = '#D98E48';
  yellow = '#f0c674';

  light_green = '#abcf84';
  green = '#afd700';
  dark_green = '#98be65';

  cyan = '#36d0e0';
  blue = '#61afef';
  violet = '#b294bb';
  magenta = '#c678dd',
  teal = '#1abc9c';
  grey = '#928374';
  brown = '#c78665';
  black = '#000000';

  bracket = '#80A0C2';
  currsor_bg = '#4f5b66';
  none = 'NONE';
}
local gl = require("galaxyline")
local condition = require("galaxyline.condition")
local gls = gl.section
gl.short_line_list = {"NvimTree", "vista", "dbui", "packer", "vista_kind", "terminal", "dashboard"}

local colors = vim.tbl_extend(
  "force",
  zephyr,
  {
    bg = "#353644",
    line_bg = "#353644",
    fg_green = "#65a380",
    darkblue = "#081633",
    purple = "#5d4d7a"
  }
)

local function ins_left(component)
  table.insert(gl.section.left, component)
end

local function ins_right(component)
  table.insert(gl.section.right, component)
end

local function ins_mid(component)
  table.insert(gl.section.mid, component)
end

ins_left  {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.blue,
        i = colors.red,
        v = colors.green,
        [""] = colors.green,
        V = colors.green,
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

ins_left {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.line_bg}
  }
}

ins_left {
  FileName = {
    provider = {"FileName"},
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.line_bg, "bold"}
  }
}

ins_left {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = font_icon.error,
    highlight = {colors.red, colors.line_bg}
  }
}

ins_left {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = font_icon.warn,
    highlight = {colors.yellow, colors.line_bg}
  }
}

ins_left {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    icon = font_icon.hint,
    highlight = {colors.cyan, colors.line_bg}
  }
}

ins_left {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    icon = font_icon.info,
    highlight = {colors.blue, colors.line_bg}
  }
}

ins_left {
  GitIcon = {
    provider = function()
      return font_icon.branch
    end,
    condition = condition.check_git_workspace,
    separator = "",
    separator_highlight = {"NONE", colors.line_bg},
    highlight = {colors.violet, colors.line_bg, "bold"}
  }
}

ins_left {
  GitBranch = {
    provider = "GitBranch",
    condition = condition.check_git_workspace,
    highlight = {colors.violet, colors.line_bg, "bold"}
  }
}

ins_left {
  BlankArea = {
    provider = function()
      return " "
    end,
    condition = condition.check_git_workspace,
    highlight = {colors.violet, colors.line_bg, "bold"}
  }
}

ins_left {
  DiffAdd = {
    provider = "DiffAdd",
    condition = condition.hide_in_width,
    icon = " " .. font_icon.add,
    highlight = {colors.green, colors.line_bg}
  }
}

ins_left {
  DiffModified = {
    provider = "DiffModified",
    condition = condition.hide_in_width,
    icon = " " .. font_icon.modifiy,
    highlight = {colors.orange, colors.line_bg}
  }
}

ins_left {
  DiffRemove = {
    provider = "DiffRemove",
    condition = condition.hide_in_width,
    icon = " " .. font_icon.deleted,
    highlight = {colors.red, colors.line_bg}
  }
}

ins_left {
  LeftEnd = {
    provider = function() return " " end,
    highlight = {colors.line_bg, colors.line_bg}
  }
}


-- ###################################################
ins_right {
  RightStart = {
    provider = function() return " " end,
    highlight = {colors.line_bg, colors.line_bg}
  }
}

-- ins_right {
--   Context = {
--     provider = "VistaPlugin",
--     highlight = {colors.green, colors.line_bg}
--   }
-- }

ins_right {
 ShowLspClient = {
    provider = "GetLspClient",
    condition = function()
      local tbl = {["dashboard"] = true, [""] = true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = font_icon.gear,
    -- separator = font_icon.line1,
    -- separator_highlight = {colors.base4, colors.line_bg},
    highlight = {colors.orange, colors.line_bg}
 }
}

ins_right {
  LineInfo = {
    provider = function()
      local line = vim.fn.line('.')
      local column = vim.fn.col('.')
      return string.format("%3d:%2d", line, column)
    end,
    separator = font_icon.line1,
    separator_highlight = {colors.base4, colors.line_bg},
    condition = condition.hide_in_width,
    highlight = {colors.bracket, colors.line_bg}
  }
}

ins_right {
  Tabstop = {
    provider = function()
      return "Spaces:" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end,
    condition = condition.hide_in_width,
    separator = font_icon.line1,
    separator_highlight = {colors.base4, colors.line_bg},
    highlight = {colors.base6, colors.line_bg}
  }
}

ins_right {
  FileEncode = {
    provider = function()
      local encode = vim.bo.fenc ~= '' and vim.bo.fenc or vim.o.enc
      return encode:upper()
    end,
    separator = font_icon.line1,
    separator_highlight = {colors.base4, colors.line_bg},
    condition = condition.hide_in_width,
    highlight = {colors.base6, colors.line_bg}
  }
}

ins_right {
  FileFormat = {
    provider = function()
      local fileformat = vim.bo.fileformat
      if fileformat == 'unix' then
        return 'LF'
      else
        return 'CRLF'
      end
    end,
    condition = condition.hide_in_width,
    separator = font_icon.line1,
    separator_highlight = {colors.base4, colors.line_bg},
    highlight = {colors.base6, colors.line_bg}
  }
}

ins_right {
  BufferType = {
    provider = "FileTypeName",
    condition = condition.hide_in_width,
    separator = font_icon.line1,
    separator_highlight = {colors.base4, colors.line_bg},
    highlight = {colors.blue, colors.line_bg, "bold"}
  }
}

-- format print current file size
local function format_file_size(file)
  local size = vim.fn.getfsize(file)
  if size == 0 or size == -1 or size == -2 then
    return ''
  end
  if size < 1024 then
    size = size .. 'b'
  elseif size < 1024 * 1024 then
    size = string.format('%.1f',size/1024) .. 'k'
  elseif size < 1024 * 1024 * 1024 then
    size = string.format('%.1f',size/1024/1024) .. 'm'
  else
    size = string.format('%.1f',size/1024/1024/1024) .. 'g'
  end
  return size
end

ins_right {
  FileSize = {
    provider = function()
      local file = vim.fn.expand('%:p')
      if string.len(file) == 0 then return '' end
      return format_file_size(file)
    end,
    separator = font_icon.line1,
    separator_highlight = {colors.base4, colors.line_bg},
    condition = condition.hide_in_width,
    highlight = {colors.base7, colors.line_bg}
  }
}

ins_right {
  LinePercent = {
    provider = "LinePercent",
    separator = font_icon.line1,
    separator_highlight = {colors.base4, colors.line_bg},
    highlight = {colors.green, colors.line_bg}
  }
}

ins_right {
  RightEnd = {
    provider = function()
      return " ▊"
    end,
    highlight = {colors.bg_popup, colors.line_bg, "bold"}
  }
}

gls.short_line_left[1] =  {
  SViMode = {
    provider = function()
      return "▊ "
    end,
    highlight = {colors.bg_popup, colors.line_bg, "bold"}
  }
}

gls.short_line_left[2] =  {
  SFileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.line_bg}
  }
}

gls.short_line_left[3] =  {
  SFileName = {
    provider = "SFileName",
    separator = " ",
    separator_highlight = {"NONE", colors.line_bg},
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.line_bg, "bold"}
  }
}

gls.short_line_left[4] = {
  SBufferType = {
    provider = "FileTypeName",
    separator = " ",
    separator_highlight = {"NONE", colors.line_bg},
    highlight = {colors.blue, colors.line_bg, "bold"}
  }
}
