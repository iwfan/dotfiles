map_cmd("n|<C-f>s", "lua require('spectre').open()")
map_cmd("v|<C-f>s", "lua require('spectre').open_visual()")
map("n|<C-f>S", "viw:lua require('spectre').open_file_search()<CR>")
