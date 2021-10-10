map_cmd("n|<C-p>s", "lua require('spectre').open()")
map_cmd("v|<C-p>s", "lua require('spectre').open_visual()")
map("n|<C-p>S", "viw:lua require('spectre').open_file_search()<CR>")
