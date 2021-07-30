local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local properties = {
  force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {}
  }
}

local components = {
  left = {active = {}, inactive = {}},
  mid = {active = {}, inactive = {}},
  right = {active = {}, inactive = {}}
}

local colors = {
  bg = '#32302f',
  bg1 = '#282828',
  black = '#282828',
  yellow = '#d8a657',
  cyan = '#89b482',
  oceanblue = '#45707a',
  green = '#a9b665',
  orange = '#e78a4e',
  violet = '#d3869b',
  magenta = '#c14a4a',
  white = '#a89984',
  fg = '#a89984',
  skyblue = '#7daea3',
  red = '#ea6962',
}

local vi_mode_colors = {
  NORMAL = 'green',
  OP = 'green',
  INSERT = 'red',
  VISUAL = 'skyblue',
  BLOCK = 'skyblue',
  REPLACE = 'violet',
  ['V-REPLACE'] = 'violet',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'green',
  SHELL = 'green',
  TERM = 'green',
  NONE = 'yellow'
}

local vi_mode_text = {
  NORMAL = '<|',
  OP = '<|',
  INSERT = '|>',
  VISUAL = '<>',
  BLOCK = '<>',
  REPLACE = '<>',
  ['V-REPLACE'] = '<>',
  ENTER = '<>',
  MORE = '<>',
  SELECT = '<>',
  COMMAND = '<|',
  SHELL = '<|',
  TERM = '<|',
  NONE = '<>'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

local function ins_left(component)
  table.insert(components.left.active, component)
end

local function ins_right(component)
  table.insert(components.right.active, component)
end

local function ins_mid(component)
  table.insert(components.mid.active, component)
end


properties.force_inactive.filetypes = {
  'NvimTree',
  'dbui',
  'packer',
  'startify',
  'fugitive',
  'fugitiveblame',
  'vista',
  "vista_kind",
  "dashboard"
}

properties.force_inactive.buftypes = {
  'terminal'
}

-- vi-mode
ins_left {
  provider = '▊',
  hl = function()
    local val = {}

    val.fg = vi_mode_utils.get_mode_color()
    val.style = 'bold'

   return val
  end,
  right_sep = ''
}
-- vi-symbol
ins_left {
  provider = function()
    return vi_mode_text[vi_mode_utils.get_vim_mode()]
  end,
  hl = function()
    local val = {}
    val.fg = vi_mode_utils.get_mode_color()
    val.bg = 'bg'
    val.style = 'bold'
    return val
  end,
  right_sep = ''
}

-- diagnosticErrors
ins_left {
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist('Error') end,
  hl = {
    fg = 'red'
  }
}
-- diagnosticWarn
ins_left {
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist('Warning') end,
  hl = {
    fg = 'yellow'
  }
}
-- diagnosticHint
ins_left {
  provider = 'diagnostic_hints',
  enabled = function() return lsp.diagnostics_exist('Hint') end,
  hl = {
    fg = 'cyan'
  }
}
-- diagnosticInfo
ins_left {
  provider = 'diagnostic_info',
  enabled = function() return lsp.diagnostics_exist('Information') end,
  hl = {
    fg = 'skyblue'
  }
}

-- gitBranch
ins_left {
  provider = 'git_branch',
  hl = {
    fg = 'yellow',
    style = 'bold'
  }
}
-- diffAdd
ins_left {
  provider = 'git_diff_added',
  hl = {
    fg = 'green'
  }
}
-- diffModfified
ins_left {
  provider = 'git_diff_changed',
  hl = {
    fg = 'orange'
  }
}
-- diffRemove
ins_left {
  provider = 'git_diff_removed',
  hl = {
    fg = 'red'
  }
}

-- RIGHT

-- lineInfo
ins_right {
  provider = 'position',
  right_sep = ' '
}
-- tabstop
ins_right {
  provider = function()
    return "Spaces:" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
  right_sep = ' '
}
-- fileEncode
ins_right {
  provider = 'file_encoding',
  hl = {
    fg = 'white',
    bg = 'bg'
  },
  right_sep = ' '
}
-- EOL
ins_right {
  provider = function()
    local fileformat = vim.bo.fileformat
    if fileformat == 'unix' then
      return 'LF'
    else
      return 'CRLF'
    end
  end,
  right_sep = ' '
}

-- fileIcon
ins_right {
  provider = function()
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon == nil then
      icon = ''
    end
    return icon
  end,
  hl = function()
    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    else
      val.fg = 'white'
    end
    val.bg = 'bg'
    val.style = 'bold'
    return val
  end,
  right_sep = ' '
}
-- fileType
ins_right {
  provider = 'file_type',
  hl = function()
    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    else
      val.fg = 'white'
    end
    val.bg = 'bg'
    return val
  end,
  right_sep = ' '
}
-- fileSize
ins_right {
  provider = 'file_size',
  enabled = function() return vim.fn.getfsize(vim.fn.expand('%:t')) > 0 end,
  hl = {
    fg = 'skyblue',
    bg = 'bg'
  },
  right_sep = ' '
}
-- linePercent
ins_right {
  provider = 'line_percentage',
  hl = {
    fg = 'white',
    bg = 'bg'
  },
  right_sep = ' '
}
-- scrollBar
ins_right {
  provider = 'scroll_bar',
  hl = {
    fg = 'yellow',
    bg = 'bg',
  },
}

-- INACTIVE

-- fileType
components.left.inactive[1] = {
  provider = 'file_type',
  hl = {
    fg = 'black',
    bg = 'cyan',
    style = 'bold'
  },
  left_sep = {
    str = ' ',
    hl = {
      fg = 'NONE',
      bg = 'cyan'
    }
  },
  right_sep = {
    {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'cyan'
      }
    },
    ' '
  }
}

components.left.inactive[2] = {
  provider = function()
    return vim.fn.expand("%:F")
  end,
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ''
}

require('feline').setup({
  colors = colors,
  default_bg = bg,
  default_fg = fg,
  vi_mode_colors = vi_mode_colors,
  components = components,
  properties = properties,
})
