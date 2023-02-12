-- matchup
vim.g.matchup_matchparen_offscreen = { method = "" }
-- multiple cursor
vim.g.VM_default_mappings = 0
vim.g.VM_maps = {
    ["Add Cursor Down"] = "<M-n>",
    ["Add Cursor Up"] = "<M-p>",
}

-- leap
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward-to)")
vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward-to)")
vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-cross-window)")

vim.keymap.set("n", "<M-f>", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>")
vim.keymap.set("v", "<M-f>", "<cmd>lua require('spectre').open_visual()<cr>")
