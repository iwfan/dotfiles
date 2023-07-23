return {
    "echasnovski/mini.files",
    version = false,
    opts = {
        mappings = {
            go_in = "L",
            go_in_plus = "l",
            reset = "<BS>",
            synchronize = "<CR>",
        },
    },
    keys = {
        {
            "<space>e",
            mode = { "n" },
            function()
                MiniFiles.open(vim.fn.expand "%")
            end,
            desc = "MiniFiles",
        },
        {
            "<C-t>",
            mode = { "n" },
            function()
                MiniFiles.open(vim.fn.expand "%")
            end,
            desc = "MiniFiles",
        },
    },
    event = "VeryLazy",
}
