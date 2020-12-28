local helpers = require 'helpers'

local bind_key = helpers.bind_key
local map_cmd   = helpers.map_cmd
local map_cu   = helpers.map_cu

helpers.parse_variable_from_table{
  -- Startify
  startify_lists = {
    { type = 'dir',       header = {'   MRU ' .. vim.fn.getcwd() }};
    { type = 'bookmarks', header = { '   Bookmarks' } };
  };

  startify_bookmarks = {
    { i = '~/dotfiles/hammerspoon/config.lua' },
    { z = '~/.zshrc' },
    { t = '~/.tmux.conf' },
  };

  startify_skiplist                 = {"COMMIT_EDITMSG"};

  startify_files_number             = 5;
  startify_custom_indices           = vim.fn.map(vim.fn.range(1,100), 'string(v:val)');
  startify_enable_special           = 1;
  startify_change_to_vcs_root       = 1;
  startify_fortune_use_unicode      = 1;


  -- vim-matchup
  matchup_matchparen_offscreen      = {};


  -- undotree
  undotree_WindowLayout             = 4;


  -- floatterm
  floaterm_width                    = 0.8;
  floaterm_height                   = 0.8;


  -- git messenger
  git_messenger_no_default_mappings = 1;


  -- far
  ["far#source"]                    = 'rg';


  -- eidtor-config
  EditorConfig_exclude_patterns     = {'fugitive://.*', 'scp://.*'};


  -- html
  closetag_filenames                = '*.html,*.xhtml,*.phtml,*.wxml';
  closetag_xhtml_filenames          = '*.xhtml,*.jsx,*.js,*.tsx,*.ts';
  closetag_filetypes                = 'html,xhtml,phtml,javascript,typescript';
  tagalong_additional_filetypes     = {'wxml'};


  -- Vista
  ["vista#renderer#enable_icon"]      = 1;
  vista_disable_statusline            = 1;
  vista_icon_indent                   = { "╰─▸ ", "├─▸ " };
  vista_default_executive             = 'ctags';
  vista_finder_alternative_executives = { 'ctags' };
  vista_echo_cursor_strategy          = 'floating_win';
  vista_executive_for                 = {
    vimwiki = 'markdown',
    pandoc = 'markdown',
    markdown = 'toc'
  };
  vista_cursor_delay                  = 200;
  vista_update_on_text_changed        = 1;
}

bind_key('n|ga', map_cmd('<Plug>(EasyAlign)'))
bind_key('x|ga', map_cmd('<Plug>(EasyAlign)'))


bind_key('n|<leader>0', map_cu('FloatermToggle'):with_noremap():with_silent())
bind_key('t|<leader>0', map_cmd([[<C-\><C-n>:FloatermToggle<CR>]]):with_noremap():with_silent())
bind_key('t|<esc><esc> ', map_cu([[<C-\><C-n>:FloatermKill<CR>]]):with_noremap():with_silent())

bind_key('n|<leader>1', map_cu('NvimTreeToggle'):with_noremap():with_silent())
bind_key('n|<leader>2', map_cu('Vista ctags'):with_noremap():with_silent())
bind_key('n|<leader>8', map_cu('UndotreeToggle'):with_noremap():with_silent())
bind_key('n|<leader>9', map_cmd('<esc>:tabe<CR>:-tabmove<CR>:term lazygit<CR>'):with_noremap():with_silent())



