local M = {}

M.setup = function()
    require("gitsigns").setup {
        signs = {
            add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
            change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
            delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
            topdelete = {
                hl = "GitSignsDelete",
                text = "‾",
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn",
            },
            changedelete = {
                hl = "GitSignsChange",
                text = "▎",
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn",
            },
        },
        current_line_blame = true,
    }

    map_cmd([[n|\c]], 'lua require"gitsigns".preview_hunk()')
    map_cmd([[n|<bs>c]], 'lua require"gitsigns".reset_hunk()')
    map_cmd([[v|\c]], 'lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})')
end

return M
