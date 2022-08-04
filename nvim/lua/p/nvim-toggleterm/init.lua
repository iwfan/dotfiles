require("toggleterm").setup {
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "vertical",
    close_on_exit = true,
    float_opts = {
        border = "curved",
        winblend = 3,
    },
}

vim.keymap.set("n", "<C-w>t", "<cmd>ToggleTerm<cr>")
vim.keymap.set("n", "<C-w>b", "<cmd>ToggleTerm direction=horizontal<cr>")

require "p.nvim-toggleterm.integration"
