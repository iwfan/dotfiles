local tools = {}
local insert = _G.insert(tools)

insert({
    "ybian/smartim",
    config = function()
        vim.g.smartim_default = "com.apple.keylayout.ABC"
    end,
})

insert("tpope/vim-repeat")
insert({ "tpope/vim-fugitive", cmd = { "Git" } })
insert({
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            signs = {
                add = { hl = "GitGutterAdd", text = "▋" },
                change = { hl = "GitGutterChange", text = "▋" },
                delete = { hl = "GitGutterDelete", text = "▋" },
                topdelete = { hl = "GitGutterDeleteChange", text = "▔" },
                changedelete = { hl = "GitGutterChange", text = "▎" },
            },
        })

        map_cmd([[n|\c]], 'lua require"gitsigns".preview_hunk()')
        map_cmd([[n|<BS>c]], 'lua require"gitsigns".reset_hunk()')
        map_cmd([[v|\c]], 'lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})')
    end,
    requires = { "nvim-lua/plenary.nvim", opt = true },
})

return tools
