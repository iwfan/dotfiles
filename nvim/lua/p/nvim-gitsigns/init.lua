local M = {}

M.setup = function()
    require("gitsigns").setup {
        signs = {
            add = { hl = "GitGutterAdd", text = "▋" },
            change = { hl = "GitGutterChange", text = "▋" },
            delete = { hl = "GitGutterDelete", text = "▋" },
            topdelete = { hl = "GitGutterDeleteChange", text = "▔" },
            changedelete = { hl = "GitGutterChange", text = "▎" },
        },
    }

    map_cmd([[n|\c]], 'lua require"gitsigns".preview_hunk()')
    map_cmd([[n|<BS>c]], 'lua require"gitsigns".reset_hunk()')
    map_cmd([[v|\c]], 'lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})')
end

return M
