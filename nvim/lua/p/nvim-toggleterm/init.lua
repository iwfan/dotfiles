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

map_cmd("n|<C-w>t", "ToggleTerm")
map_cmd("n|<C-w>b", "ToggleTerm direction=horizontal")

require "p.nvim-toggleterm.integration"
