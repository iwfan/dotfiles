" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/f/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/f/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/f/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/f/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/f/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ReplaceWithRegister = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/ReplaceWithRegister"
  },
  ["accelerated-jk"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/accelerated-jk"
  },
  ["coc.nvim"] = {
    config = { "\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14plugs.coc\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/f/.local/share/nvim/site/pack/packer/opt/coc.nvim"
  },
  ["completion-treesitter"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/completion-treesitter"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n·\5\0\0\4\0\22\0\0296\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\b\0005\2\6\0005\3\5\0=\3\a\2=\2\t\0015\2\v\0005\3\n\0=\3\a\2=\2\f\0015\2\14\0005\3\r\0=\3\a\2=\2\15\0015\2\17\0005\3\16\0=\3\a\2=\2\18\0015\2\20\0005\3\19\0=\3\a\2=\2\21\1=\1\4\0K\0\1\0\18find_register\1\0\1\fcommand\22DashboardJumpMark\1\2\0\0009ï‘¤  Find  Register                          SPC f r\14find_word\1\0\1\fcommand\22DashboardFindWord\1\2\0\0009ï†š  Find  Word                              SPC f g\14find_file\1\0\1\fcommand\22DashboardFindFile\1\2\0\0009ï…œ  Find  File                              SPC f f\17find_history\1\0\1\fcommand\25DashboardFindHistory\1\2\0\0009ïœ¡  Recently opened files                   SPC f h\rnew_file\1\0\0\16description\1\0\1\fcommand\21DashboardNewFile\1\2\0\0009ïœ•  New   File                              SPC t f\29dashboard_custom_section\14telescope dashboard_default_executive\6g\bvim\0" },
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  delimitMate = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/delimitMate"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["far.vim"] = {
    commands = { "F", "Far", "Fardo" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/f/.local/share/nvim/site/pack/packer/opt/far.vim"
  },
  ["formatter.nvim"] = {
    commands = { "Format" },
    config = { "\27LJ\2\nŠ\1\0\0\5\0\6\0\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\2>\2\2\1=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\4\0\0\21--stdin-filepath\0\19--single-quote\1\0\2\nstdin\2\bexe\rprettierN\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\4\0\0\19--indent-count\3\2\f--stdin\1\0\2\nstdin\2\bexe\vluafmt0\0\0\2\0\2\0\0045\0\0\0004\1\0\0=\1\1\0L\0\2\0\targs\1\0\2\nstdin\2\bexe\ngofmtï\1\1\0\a\0\15\0\0303\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0005\4\5\0004\5\3\0>\0\1\5=\5\6\0044\5\3\0>\0\1\5=\5\a\0044\5\3\0>\0\1\5=\5\b\0044\5\3\0>\0\1\5=\5\t\0044\5\3\0003\6\n\0>\6\1\5=\5\v\0044\5\3\0003\6\f\0>\6\1\5=\5\r\4=\4\14\3B\1\2\1K\0\1\0\rfiletype\ago\0\blua\0\20typescriptreact\15typescript\20javascriptreact\15javascript\1\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/f/.local/share/nvim/site/pack/packer/opt/formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugs.galaxyline\frequire\0" },
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/git-messenger.vim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  ["incsearch-easymotion.vim"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/incsearch-easymotion.vim"
  },
  ["incsearch.vim"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/incsearch.vim"
  },
  ["indent-guides.nvim"] = {
    config = { "\27LJ\2\nº\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\22exclude_filetypes\1\a\0\0\rNvimTree\14dashboard\nvista\thelp\14sagahover\rterminal\1\0\2\23indent_start_level\3\2\22indent_guide_size\3\1\nsetup\18indent_guides\frequire\0" },
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/indent-guides.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n…\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\3\27always_show_bufferline\1\rmappings\1\tview\16multiwindow\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n£\2\0\0\4\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\2B\0\2\1K\0\1\0\thtml\1\0\1\tmode\15foreground\ttmux\1\0\1\nnames\1\bvim\1\0\1\nnames\2\vstylus\1\0\1\vrgb_fn\2\tsass\1\0\1\vrgb_fn\2\tscss\1\0\1\vrgb_fn\2\bcss\1\5\0\0\15javascript\20javascriptreact\15typescript\20typescriptreact\1\0\1\vrgb_fn\2\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-terminal.lua"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rterminal\frequire\0" },
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/nvim-terminal.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/f/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  smartim = {
    config = { "\27LJ\2\nI\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\28com.apple.keylayout.ABC\20smartim_default\6g\bvim\0" },
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/smartim"
  },
  ["tagalong.vim"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/tagalong.vim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÀ\1\0\0\5\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/f/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-bbye"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-be-good"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-exchange"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-peekaboo"
  },
  ["vim-qf"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-qf"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-scriptease"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-scriptease"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-speeddating"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-speeddating"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-textobj-entire"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-translator"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-translator"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/vim-which-key"
  },
  ["vista.vim"] = {
    commands = { "Vista" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/f/.local/share/nvim/site/pack/packer/opt/vista.vim"
  },
  ["zephyr-nvim"] = {
    config = { "\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vzephyr\frequire\0" },
    loaded = true,
    path = "/Users/f/.local/share/nvim/site/pack/packer/start/zephyr-nvim"
  }
}

-- Config for: dashboard-nvim
try_loadstring("\27LJ\2\n·\5\0\0\4\0\22\0\0296\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\b\0005\2\6\0005\3\5\0=\3\a\2=\2\t\0015\2\v\0005\3\n\0=\3\a\2=\2\f\0015\2\14\0005\3\r\0=\3\a\2=\2\15\0015\2\17\0005\3\16\0=\3\a\2=\2\18\0015\2\20\0005\3\19\0=\3\a\2=\2\21\1=\1\4\0K\0\1\0\18find_register\1\0\1\fcommand\22DashboardJumpMark\1\2\0\0009ï‘¤  Find  Register                          SPC f r\14find_word\1\0\1\fcommand\22DashboardFindWord\1\2\0\0009ï†š  Find  Word                              SPC f g\14find_file\1\0\1\fcommand\22DashboardFindFile\1\2\0\0009ï…œ  Find  File                              SPC f f\17find_history\1\0\1\fcommand\25DashboardFindHistory\1\2\0\0009ïœ¡  Recently opened files                   SPC f h\rnew_file\1\0\0\16description\1\0\1\fcommand\21DashboardNewFile\1\2\0\0009ïœ•  New   File                              SPC t f\29dashboard_custom_section\14telescope dashboard_default_executive\6g\bvim\0", "config", "dashboard-nvim")
-- Config for: nvim-colorizer.lua
try_loadstring("\27LJ\2\n£\2\0\0\4\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\2B\0\2\1K\0\1\0\thtml\1\0\1\tmode\15foreground\ttmux\1\0\1\nnames\1\bvim\1\0\1\nnames\2\vstylus\1\0\1\vrgb_fn\2\tsass\1\0\1\vrgb_fn\2\tscss\1\0\1\vrgb_fn\2\bcss\1\5\0\0\15javascript\20javascriptreact\15typescript\20typescriptreact\1\0\1\vrgb_fn\2\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
-- Config for: smartim
try_loadstring("\27LJ\2\nI\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\28com.apple.keylayout.ABC\20smartim_default\6g\bvim\0", "config", "smartim")
-- Config for: galaxyline.nvim
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugs.galaxyline\frequire\0", "config", "galaxyline.nvim")
-- Config for: telescope.nvim
try_loadstring("\27LJ\2\nÀ\1\0\0\5\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
-- Config for: indent-guides.nvim
try_loadstring("\27LJ\2\nº\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\22exclude_filetypes\1\a\0\0\rNvimTree\14dashboard\nvista\thelp\14sagahover\rterminal\1\0\2\23indent_start_level\3\2\22indent_guide_size\3\1\nsetup\18indent_guides\frequire\0", "config", "indent-guides.nvim")
-- Config for: nvim-bufferline.lua
try_loadstring("\27LJ\2\n…\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\3\27always_show_bufferline\1\rmappings\1\tview\16multiwindow\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
-- Config for: zephyr-nvim
try_loadstring("\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vzephyr\frequire\0", "config", "zephyr-nvim")
-- Config for: nvim-terminal.lua
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rterminal\frequire\0", "config", "nvim-terminal.lua")
-- Config for: nvim-web-devicons
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")

-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file Vista lua require("packer.load")({'vista.vim'}, { cmd = "Vista", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Fardo lua require("packer.load")({'far.vim'}, { cmd = "Fardo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Format lua require("packer.load")({'formatter.nvim'}, { cmd = "Format", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file F lua require("packer.load")({'far.vim'}, { cmd = "F", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Far lua require("packer.load")({'far.vim'}, { cmd = "Far", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType lua ++once lua require("packer.load")({'formatter.nvim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'coc.nvim', 'formatter.nvim'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'coc.nvim', 'formatter.nvim'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'coc.nvim', 'formatter.nvim'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'coc.nvim', 'formatter.nvim'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'coc.nvim', 'formatter.nvim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'coc.nvim', 'formatter.nvim'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'coc.nvim', 'formatter.nvim'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'formatter.nvim'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
