require("bufferline").setup {
    options = {
        themable = false,
        left_mouse_command = "buffer %d",
        show_buffer_close_icons = false,
        modified_icon = "●",
        left_trunc_marker = "",
        right_trunc_marker = "",
        show_close_icon = false,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        always_show_bufferline = false,
    },
}

vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "[B", "<cmd>BufferLineMovePrev<cr>")
vim.keymap.set("n", "]B", "<cmd>BufferLineMoveNext<cr>")
vim.keymap.set("n", "\\b", "<cmd>BufferLineTogglePin<cr>")
vim.keymap.set("n", "<bs>b", "<cmd>Bdelete!<cr>")

vim.keymap.set("n", "[f", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "]f", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "[F", "<cmd>BufferLineMovePrev<cr>")
vim.keymap.set("n", "]F", "<cmd>BufferLineMoveNext<cr>")
vim.keymap.set("n", "\\f", "<cmd>BufferLinePick<cr>")
vim.keymap.set("n", "<bs>f", "<cmd>Bdelete!<cr>")
