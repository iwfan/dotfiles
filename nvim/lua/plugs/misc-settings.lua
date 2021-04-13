local helpers = require "helpers"

local bind_key = helpers.bind_key
local map_cmd = helpers.map_cmd
local map_cu = helpers.map_cu

helpers.parse_variable_from_table {
  -- vim-matchup
  matchup_matchparen_offscreen = {},
  -- undotree
  undotree_WindowLayout = 4,
  -- floatterm
  floaterm_width = 0.8,
  floaterm_height = 0.8,
  -- git messenger
  git_messenger_no_default_mappings = 1,
  -- far
  ["far#source"] = "rg",
  -- eidtor-config
  EditorConfig_exclude_patterns = {"fugitive://.*", "scp://.*"},
  -- Vista
  ["vista#renderer#enable_icon"] = 1,
  vista_disable_statusline = 1,
  vista_icon_indent = {"╰─▸ ", "├─▸ "},
  vista_default_executive = "ctags",
  vista_finder_alternative_executives = {"ctags"},
  vista_echo_cursor_strategy = "floating_win",
  vista_executive_for = {
    vimwiki = "markdown",
    pandoc = "markdown",
    markdown = "toc"
  },
  vista_cursor_delay = 200,
  vista_update_on_text_changed = 1
}

bind_key("n|ga", map_cmd("<Plug>(EasyAlign)"))
bind_key("x|ga", map_cmd("<Plug>(EasyAlign)"))

bind_key("n|<leader>0", map_cu("FloatermToggle"):with_noremap():with_silent())
bind_key("t|<leader>0", map_cmd([[<C-\><C-n>:FloatermToggle<CR>]]):with_noremap():with_silent())
bind_key("t|<esc><esc> ", map_cu([[<C-\><C-n>:FloatermKill<CR>]]):with_noremap():with_silent())

bind_key("n|<leader>2", map_cu("Vista ctags"):with_noremap():with_silent())
bind_key("n|<leader>8", map_cu("UndotreeToggle"):with_noremap():with_silent())
bind_key("n|<leader>9", map_cmd("<esc>:tabe<CR>:-tabmove<CR>:term lazygit<CR>"):with_noremap():with_silent())
