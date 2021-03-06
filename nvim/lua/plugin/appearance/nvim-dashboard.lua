vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {description = {'  Reload Last Session            SPC r s'}, command = 'SessionLoad'},
    b = {description = {'  Recently Opened Files          SPC f o'}, command = 'Telescope oldfiles'},
    c = {description = {'  Open Project                   SPC f p'}, command = 'Telescope project'},
    d = {description = {'  Find File                      SPC f f'}, command = 'Telescope find_files'},
    e = {description = {'  Open Neovim Configuration             '}, command = ':e ~/.config/nvim/init.lua'}
}

function _G.save_session_and_exit()
  vim.cmd("wa")
  vim.cmd("SessionSave")
  vim.cmd("xa")
end

vim.cmd('command! -nargs=0 Q call v:lua.save_session_and_exit()')

vim.g.dashboard_custom_header = {
  "                                                                      ",
  "        ███████████           █████      ██                     ",
  "       ███████████             █████                             ",
  "       ████████████████ ███████████ ███   ███████     ",
  "      ████████████████ ████████████ █████ ██████████████   ",
  "     ████████████████████████████ █████ █████ ████ █████   ",
  "   ██████████████████████  ████████ █████ █████ ████ █████  ",
  "  ██████  ███ ███    ███ ███ ████ █████ █████ ████ ██████ ",
  "  ██████   ██  ███████████████   ██ █████████████████ ",
  "  ██████   ██  ███████████████   ██ █████████████████ ",
  "                                                                        ",
}

vim.g.dashboard_custom_footer = { "" }
