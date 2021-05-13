local tools = {}
local insert = _G.insert(tools)

insert {
  "ybian/smartim",
  config = function()
    g.smartim_default = "com.apple.keylayout.ABC"
  end
}

insert "voldikss/vim-translator"

insert "tpope/vim-repeat"
insert "tpope/vim-surround"

--insert "tpope/vim-obsession"
--insert "tpope/vim-commentary"
--insert "tpope/vim-dispatch"

--insert "wellle/targets.vim"
--insert "kana/vim-textobj-user"
--insert "kana/vim-textobj-entire"
--insert "tommcdo/vim-exchange"
--insert "vim-scripts/ReplaceWithRegister"


return tools

