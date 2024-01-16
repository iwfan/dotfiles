return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            window = {
                border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
            },
        },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                search = {
                    enabled = false,
                }
            }
        },
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump({ multi_window = false })
                end,
                desc = "Flash",
            },
        },
    },
}
