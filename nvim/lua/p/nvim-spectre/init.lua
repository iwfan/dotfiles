map_cmd("n|<leader>S", "lua require('spectre').open()")
map_cmd("n|<leader>sw", "lua require('spectre').open_visual({select_word=true})")
map("n|<leader>sp", "viw:lua require('spectre').open_file_search()<CR>")
map_cmd("v|<leader>s", "lua require('spectre').open_visual()")
