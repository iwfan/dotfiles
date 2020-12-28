local exec = vim.api.nvim_command
local fn = vim.fn

local packer_exists = pcall(exec, [[packadd packer.nvim]])

if not packer_exists then

  local directory = string.format(
    '%s/site/pack/packer/opt',
    fn.stdpath('data')
  )

  fn.mkdir(directory, 'p')

  exec(string.format(
    '!git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))

  exec [[packadd packer.nvim]]
  return
end

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }

  use 'tpope/vim-speeddating'
  use 'tpope/vim-repeat'
  use 'tpope/vim-abolish'
  use 'tpope/vim-obsession'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-characterize'
  use 'tpope/vim-scriptease'
  use 'tpope/vim-dispatch'

  use 'theprimeagen/vim-be-good'

  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'nvim-lua/lsp-status.nvim'
  use {
       'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
      }
  use 'nvim-treesitter/completion-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'
  use 'tjdevries/nlua.nvim'
  use 'tjdevries/lsp_extensions.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'Akin909/nvim-bufferline.lua'
  use 'moll/vim-bbye'
  use 'glepnir/zephyr-nvim'
  use 'glepnir/galaxyline.nvim'
  use 'glepnir/indent-guides.nvim'
  use 'mhinz/vim-startify'

  use 'norcalli/nvim-colorizer.lua'
  use 'norcalli/nvim-terminal.lua'

  use 'romainl/vim-qf'

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'

  use 'wellle/targets.vim'
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-entire'
  use 'junegunn/vim-easy-align'

  use {'mg979/vim-visual-multi', branch = 'master'}
  use 'andymass/vim-matchup'

  use 'Raimondi/delimitMate'

  --  Speed j/k when press
  use 'rhysd/accelerated-jk'

  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'junegunn/gv.vim'
  use 'rhysd/git-messenger.vim'
  use 'mhinz/vim-signify'

  use 'kshenoy/vim-signature'

  use 'junegunn/vim-peekaboo'
  use 'voldikss/vim-floaterm'

  use 'editorconfig/editorconfig-vim'
  use 'liuchengxu/vim-which-key'
  use 'mbbill/undotree'

  -- searching
  use 'haya14busa/incsearch.vim'
  use 'easymotion/vim-easymotion'
  use 'haya14busa/incsearch-easymotion.vim'
  -- Find & Replace
  use {
      'brooth/far.vim',
      cmd = {'F', 'Far', 'Fardo'},
      run = ":UpdateRemotePlugins"
  }

  -- use 'AndrewRadev/splitjoin.vim'
  -- use 'machakann/vim-swap'
  -- use 'machakann/vim-textobj-delimited'

-- use 'pechorin/any-jump.vim'

-- use 'liuchengxu/vista.vim'

-- " === html Plugins === "
-- use 'alvan/vim-closetag'
-- use 'AndrewRadev/tagalong.vim'

-- " === css Plugins === "
-- use 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'javascript','javascriptreact' ] }

-- " === Javascript Plugins === "
-- use 'moll/vim-node'
-- use 'leafgarland/typescript-vim'
-- use 'peitalin/vim-jsx-typescript'

-- use 'prettier/vim-prettier', {
--  \ 'do': 'yarn install',
--  \ 'for': ['javascript', 'typescript', 'javascriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

end)


