-- vim.opt.foldcolumn = "1" -- '0' is not bad
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set("n", "K", function()
    local winid = require("ufo").peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end)

require("ufo").setup {
    provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
    end,
}

-- matchup
vim.g.matchup_matchparen_offscreen = { method = "" }
-- multiple cursor
vim.g.VM_default_mappings = 0
vim.g.VM_maps = {
    ["Add Cursor Down"] = "<M-j>",
    ["Add Cursor Up"] = "<M-k>",
}

-- leap
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward-to)")
vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward-to)")
vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-cross-window)")

vim.keymap.set("n", "<M-f>", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>")
vim.keymap.set("v", "<M-f>", "<cmd>lua require('spectre').open_visual()<cr>")
