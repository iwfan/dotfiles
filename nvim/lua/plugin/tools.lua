local tools = {}
local insert = _G.insert(tools)

insert {
  "voldikss/vim-floaterm",
  cmd = {
    'FloatermNew',
    'FloatermPrev',
    'FloatermNext',
    'FloatermFirst',
    'FloatermLast',
    'FloatermHide',
    'FloatermShow',
    'FloatermKill',
    'FloatermToggle'
  },
  config = function()
    var_tbl({
      floaterm_width = 0.9;
      floaterm_height = 0.9;
      floaterm_autoclose = 1;
    })
  end
}

insert {
  "ybian/smartim",
  config = function()
    g.smartim_default = "com.apple.keylayout.ABC"
  end
}

insert {
  "voldikss/vim-translator",
  cmd = {
    "Translate",
    "TranslateW",
    "TranslateR",
    "TranslateX",
  }
}

return tools
