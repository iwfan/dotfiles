vim.keymap.set("n", "<C-q>f", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>")
vim.keymap.set("v", "<C-q>f", "<cmd>lua require('spectre').open_visual()<cr>")
