local helpers = require "helpers"

local bind_key = helpers.bind_key
local map_cmd = helpers.map_cmd
local map_cr = helpers.map_cr
local map_cu = helpers.map_cu

vim.g.mapleader = " "

bind_key("n| ", map_cmd(""):with_noremap())
bind_key("x| ", map_cmd(""):with_noremap())

bind_key("n|q", map_cmd(""):with_noremap())
bind_key("n|<C-q>", map_cmd(""):with_noremap())
bind_key("n|Q", map_cmd("q"):with_noremap())

bind_key("n|k", map_cmd([[(v:count == 0 ? 'gk' : 'k')]]):with_noremap():with_expr())
bind_key("n|j", map_cmd([[(v:count == 0 ? 'gj' : 'j')]]):with_noremap():with_expr())

bind_key("i|<C-a>", map_cmd("<C-o>^"):with_noremap())
bind_key("c|<C-a>", map_cmd("<HOME>"):with_noremap())
bind_key("!|<C-b>", map_cmd("<Left>"):with_noremap())
bind_key("!|<C-d>", map_cmd("<Del>"):with_noremap())
bind_key("!|<C-e>", map_cmd("<END>"):with_noremap())
bind_key("!|<C-f>", map_cmd("<Right>"):with_noremap())
bind_key("!|<C-h>", map_cmd("<BS>"):with_noremap())
bind_key("i|<C-k>", map_cmd("<C-o>d$"):with_noremap())
bind_key("i|<C-s>", map_cmd([[empty(expand("%:t")) ? "\<C-o>:w\<Space>" : "<C-o>:w\<CR>"]]):with_noremap():with_expr())
bind_key("n|<C-s>", map_cmd([[empty(expand('%:t')) ? ":w\<Space>" : ":w\<CR>"]]):with_noremap():with_expr())
bind_key("i|<C-u>", map_cmd("<C-o>d^"):with_noremap())
bind_key("!|<C-v>", map_cmd("<C-r>*"):with_noremap())
bind_key("i|<C-z>", map_cmd("<C-o>u"):with_noremap())
bind_key("i|<C-c>", map_cmd("<ESC>"):with_noremap())

_G.search_in_google = function (text)
    os.execute('open "https://google.com/search?q="' .. text)
end

bind_key("n|<C-q><C-g>", map_cr([[lua search_in_google(vim.fn.expand("<cword>"))]]):with_noremap())
bind_key("v|<C-q><C-g>", map_cr([["gy<Esc>:lua search_in_google(vim.fn.getreg('g'))]]):with_noremap())

bind_key("n|<C-h>", map_cmd("<C-w>h"):with_noremap())
bind_key("n|<C-j>", map_cmd("<C-w>j"):with_noremap())
bind_key("n|<C-k>", map_cmd("<C-w>k"):with_noremap())
bind_key("n|<C-l>", map_cmd("<C-w>l"):with_noremap())

bind_key("n|<C-w><up>", map_cr("res +5"):with_noremap():with_silent())
bind_key("n|<C-w><down>", map_cr("res -5"):with_noremap():with_silent())
bind_key("n|<C-w><right>", map_cr("vertical resize +5"):with_noremap():with_silent())
bind_key("n|<C-w><left>", map_cr("vertical resize -5"):with_noremap():with_silent())

bind_key("v|<", map_cmd("<gv"):with_noremap())
bind_key("v|>", map_cmd(">gv"):with_noremap())
bind_key("n|<", map_cmd("<<"):with_noremap())
bind_key("n|>", map_cmd(">>"):with_noremap())

bind_key("n|<leader><backspace>", map_cmd('"_dd'):with_noremap())
bind_key("n|H", map_cmd("^"):with_noremap())
bind_key("v|H", map_cmd("^"):with_noremap())
bind_key("n|L", map_cmd("$"):with_noremap())
bind_key("v|L", map_cmd("$"):with_noremap())

bind_key("n|<C-S-up>", map_cmd(":m .-2<CR>=="):with_silent())
bind_key("n|<C-S-down>", map_cmd(":m .+1<CR>=="):with_silent())
bind_key("i|<C-S-up>", map_cmd("<Esc>:m .-2<CR>==gi"):with_silent())
bind_key("i|<C-S-down>", map_cmd("<Esc>:m .+1<CR>==gi"):with_silent())
bind_key("v|<C-S-up>", map_cmd(":m '<-2<CR>gv=gv"):with_silent())
bind_key("v|<C-S-down>", map_cmd(":m '>+1<CR>gv=gv"):with_silent())

bind_key("t|<C-h>", map_cmd([[<C-\><C-N><C-w>h]]):with_noremap())
bind_key("t|<C-j>", map_cmd([[<C-\><C-N><C-w>j]]):with_noremap())
bind_key("t|<C-k>", map_cmd([[<C-\><C-N><C-w>k]]):with_noremap())
bind_key("t|<C-l>", map_cmd([[<C-\><C-N><C-w>l]]):with_noremap())
bind_key("t|<C-o>", map_cmd([[<C-\><C-N><C-o>]]):with_noremap())
bind_key("t|<C-n>", map_cmd([[<C-\><C-N>]]):with_noremap())
bind_key("t|<Esc>", map_cmd([[<C-\><C-N>]]):with_noremap())
bind_key("n|<C-w><C-t>", map_cmd("<esc>:split<CR>:term<CR>"):with_noremap():with_silent())

bind_key(
  "n|<C-f>",
  map_cmd("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>"):with_silent():with_noremap():with_nowait()
)
bind_key(
  "n|<C-b>",
  map_cmd("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>"):with_silent():with_noremap():with_nowait()
)
bind_key("n|]d", map_cr("Lspsaga diagnostic_jump_next"):with_noremap():with_silent())
bind_key("n|[d", map_cr("Lspsaga diagnostic_jump_prev"):with_noremap():with_silent())
bind_key("n|\\d", map_cr("Lspsaga show_line_diagnostics"):with_noremap():with_silent())
bind_key("n|K", map_cr("Lspsaga hover_doc"):with_noremap():with_silent())
bind_key("n|<space><cr>", map_cr("Lspsaga code_action"):with_noremap():with_silent())
bind_key("v|<space><cr>", map_cu("Lspsaga range_code_action"):with_noremap():with_silent())
bind_key("n|gd", map_cr("<cmd>lua vim.lsp.buf.definition()<CR>"):with_noremap():with_silent())
bind_key("n|gD", map_cmd("<cmd>lua vim.lsp.buf.declaration()<CR>"):with_noremap():with_silent())
bind_key("n|gi", map_cmd("<cmd>lua vim.lsp.buf.implementation()<CR>"):with_noremap():with_silent())
bind_key("n|gr", map_cmd("<cmd>lua vim.lsp.buf.references()<CR>"):with_noremap():with_silent())
bind_key("n|<space>K", map_cr("Lspsaga signature_help"):with_noremap():with_silent())
bind_key("n|<space>rn", map_cr("Lspsaga rename"):with_noremap():with_silent())
bind_key("n|gh", map_cr("Lspsaga lsp_finder"):with_noremap():with_silent())
bind_key("n|D", map_cmd("<cmd>lua vim.lsp.buf.type_definition()<CR>"):with_noremap():with_silent())
bind_key("n|<Leader>cw", map_cmd("<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"):with_noremap():with_silent())

bind_key("n|<F3>", map_cu("PackerCompile"))
bind_key("n|<F4>", map_cu("PackerSync"))

bind_key("n|<leader>ff", map_cu("lua require('telescope.builtin').git_files()"):with_silent())
bind_key("n|<leader>fa", map_cu("lua require('telescope.builtin').find_files()"):with_silent())
bind_key("n|<leader>fb", map_cu("lua require('telescope.builtin').buffers()"):with_silent())
bind_key("n|<leader>fg", map_cu("lua require('telescope.builtin').live_grep()"):with_silent())
bind_key(
  "n|<leader>fw",
  map_cu([[lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})]]):with_silent()
)
bind_key("n|<leader>ft", map_cu("lua require('telescope.builtin').help_tags()"):with_silent())
bind_key("n|<leader>fr", map_cu("lua require('telescope.builtin').registers()"):with_silent())
bind_key("n|<leader>fh", map_cu("lua require('telescope.builtin').oldfiles()"):with_silent())

bind_key("n|ga", map_cmd("<Plug>(EasyAlign)"))
bind_key("x|ga", map_cmd("<Plug>(EasyAlign)"))
bind_key("i|<C-q>", map_cmd("<Plug>(emmet-expand-abbr)"))

bind_key("n|<leader>0", map_cu("FloatermToggle"):with_noremap():with_silent())
bind_key("t|<leader>0", map_cmd([[<C-\><C-n>:FloatermToggle<CR>]]):with_noremap():with_silent())
bind_key("t|<esc><esc> ", map_cu([[<C-\><C-n>:FloatermKill<CR>]]):with_noremap():with_silent())

bind_key("n|<leader>2", map_cu("Vista nvim_lsp"):with_noremap():with_silent())
bind_key("n|<leader>8", map_cu("UndotreeToggle"):with_noremap():with_silent())
bind_key("n|<leader>9", map_cmd("<esc>:tabe<CR>:-tabmove<CR>:term lazygit<CR>"):with_noremap():with_silent())
