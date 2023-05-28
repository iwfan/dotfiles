-- local FileFormat = {
--     provider = function()
--         local fileformat = vim.bo.fileformat
--         if fileformat == "unix" then
--             return "LF"
--         else
--             return "CRLF"
--         end
--     end,
--     hl = { fg = colors.grey, bg = colors.bg },
-- }
--
--
-- local IndentSize = {
--     {
--         provider = function()
--             return vim.api.nvim_buf_get_option(0, "shiftwidth")
--         end,
--         hl = { fg = colors.grey1, bg = colors.bg },
--     },
--     { provider = "x", hl = { fg = colors.grey, bg = colors.bg } },
--     { provider = "SPC", hl = { fg = colors.grey, bg = colors.bg } },
-- }
--
-- local Spell = {
--     condition = function()
--         return vim.wo.spell
--     end,
--     provider = " SPELL",
--     hl = { fg = colors.orange, bg = colors.bg, bold = true },
-- }


require('lualine').setup {
  options = {
    theme = "auto",
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { { 'branch',icon = '' }, 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = { 'filetype', 'encoding' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
