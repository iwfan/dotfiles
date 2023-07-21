return {
    "echasnovski/mini.files",
    version = false,
    opts = {
        mappings = {
            go_in = "L",
            go_in_plus = "l",
        },
    },
    keys = {
        {
            "<c-e>",
            mode = { "n" },
            function()
                MiniFiles.open(vim.fn.expand "%")
            end,
            desc = "MiniFiles",
        },
    },
    event = "VeryLazy",
}
