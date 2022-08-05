vim.keymap.set("n", "<M-f>", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>")
vim.keymap.set("v", "<M-f>", "<cmd>lua require('spectre').open_visual()<cr>")
