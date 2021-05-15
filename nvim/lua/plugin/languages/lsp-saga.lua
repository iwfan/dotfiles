local saga = require 'lspsaga'

saga.init_lsp_saga({
  code_action_icon = emoji_icon.fire,
  use_saga_diagnostic_sign = true,
  error_sign = emoji_icon.error,
  warn_sign = emoji_icon.warn,
  hint_sign = emoji_icon.hint,
  infor_sign = emoji_icon.info,
  dianostic_header_icon = '   ',
  code_action_prompt = {
    enable = true,
    sign = false,
    sign_priority = 0,
    virtual_text = true,
  },
  finder_definition_icon = '  ',
  finder_reference_icon = '  ',
  max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
    open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
  },
  code_action_keys = {
    quit = 'q', exec = '<CR>'
  },
  rename_action_keys = {
    quit = '<C-c>',exec = '<CR>'  -- quit can be a table
  },
  definition_preview_icon = '  ',
  rename_prompt_prefix = '➤',
})
