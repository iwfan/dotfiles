local helpers = require "helpers"

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
