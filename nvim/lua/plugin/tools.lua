local tools = {}
local insert = _G.insert(tools)

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

--insert "tpope/vim-dispatch"
--insert "wellle/targets.vim"
--insert "kana/vim-textobj-user"
--insert "kana/vim-textobj-entire"
--insert "tommcdo/vim-exchange"


return tools
