local tools = {}
local insert = _G.insert(tools)

insert {
  "editorconfig/editorconfig-vim",
  config = [[vim.g.EditorConfig_exclude_patterns = {"fugitive://.*", "scp://.*"}]]
}

insert {
  "ybian/smartim",
  config = function()
    vim.g.smartim_default = "com.apple.keylayout.ABC"
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
