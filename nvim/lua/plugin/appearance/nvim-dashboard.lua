vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {description = {'  Reload Last Session            SPC r s'}, command = 'SessionLoad'},
    b = {description = {'  Recently Opened Files          SPC f o'}, command = 'Telescope oldfiles'},
    c = {description = {'  Open Project                   SPC f p'}, command = 'Telescope project'},
    d = {description = {'  Find File                      SPC f f'}, command = 'Telescope find_files'},
    e = {description = {'  Open Neovim Configuration             '}, command = ':e ~/.config/nvim/init.lua'}
}

map("n|<C-s>", [[empty(expand('%:t')) ? ":w\<Space>" : ":w\<CR>:SessionSave\<CR>"]], { expr = true })

vim.g.dashboard_custom_header = {
  "                                                                        ",
  "                                                                      ",
  "        ███████████           █████      ██                     ",
  "       ███████████             █████                             ",
  "       ████████████████ ███████████ ███   ███████     ",
  "      ████████████████ ████████████ █████ ██████████████   ",
  "     ████████████████████████████ █████ █████ ████ █████   ",
  "   ██████████████████████  ████████ █████ █████ ████ █████  ",
  "  ██████  ███ ███     ██  ███ ████ █████ █████ ████ ██████ ",
  "  ██████   ██  ██    █████   ██ █████████████████ ",
  "  ██████   ██  ███████████████   ██ █████████████████ ",
  "                                                                        ",
}

vim.g.dashboard_custom_footer = { "" }
