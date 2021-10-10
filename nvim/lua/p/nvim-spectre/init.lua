map_cmd("n|<leader>fs", "lua require('spectre').open()")
map_cmd("v|<leader>fs", "lua require('spectre').open_visual()")
map("n|<leader>fS", "viw:lua require('spectre').open_file_search()<CR>")
