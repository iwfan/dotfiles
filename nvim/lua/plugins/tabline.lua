return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
    event = "BufReadPost",
    opts = {
        options = {
            separator_style = "thin",
            modified_icon = "",
            show_close_icon = false,
            show_buffer_close_icons = false,
        },
        highlights = {
            separator = {
                fg = '#343f44',
                bg = '#343f44'
            },
            background = {
                fg = '#859289',
                bg = '#3d484d'
            },
            modified = {
                bg = '#3d484d'
            },
            pick = {
                bg = '#3d484d'
            },
            fill = {
                bg = '#343f44'
            }
        },
    },
    keys = {
        {
            "[f",
            mode = { "n" },
            "<cmd>BufferLineCyclePrev<cr>",
            desc = "Prev Buffer",
        },
        {
            "]f",
            mode = { "n" },
            "<cmd>BufferLineCycleNext<cr>",
            desc = "Next Buffer",
        },
        {
            "[F",
            mode = { "n" },
            "<cmd>BufferLineMovePrev<cr>",
            desc = "Move Buffer Prev",
        },
        {
            "]F",
            mode = { "n" },
            "<cmd>BufferLineMoveNext<cr>",
            desc = "Move Buffer Next",
        },
        {
            "<bs>f",
            mode = { "n" },
            "<cmd>Bdelete<cr>",
            desc = "Remove Buffer",
        },
        {
            "\\f",
            mode = { "n" },
            "<cmd>BufferLinePick<cr>",
            desc = "Show Buffer",
        },
        {
            "<space>1",
            mode = { "n" },
            "<cmd>BufferLineGoToBuffer 1<cr>",
            desc = "Go to buffer",
        },
        {
            "<space>2",
            mode = { "n" },
            "<cmd>BufferLineGoToBuffer 2<cr>",
            desc = "Go to buffer",
        },
        {
            "<space>3",
            mode = { "n" },
            "<cmd>BufferLineGoToBuffer 3<cr>",
            desc = "Go to buffer",
        },
        {
            "<space>4",
            mode = { "n" },
            "<cmd>BufferLineGoToBuffer 4<cr>",
            desc = "Go to buffer",
        },
        {
            "<space>5",
            mode = { "n" },
            "<cmd>BufferLineGoToBuffer 5<cr>",
            desc = "Go to buffer",
        },
        {
            "<space>6",
            mode = { "n" },
            "<cmd>BufferLineGoToBuffer 6<cr>",
            desc = "Go to buffer",
        },
        {
            "<space>7",
            mode = { "n" },
            "<cmd>BufferLineGoToBuffer 7<cr>",
            desc = "Go to buffer",
        },
        {
            "<space>8",
            mode = { "n" },
            "<cmd>BufferLineGoToBuffer 8<cr>",
            desc = "Go to buffer",
        },
        {
            "<space>9",
            mode = { "n" },
            "<cmd>BufferLineGoToBuffer 9<cr>",
            desc = "Go to buffer",
        },
        {
            "<space>0",
            mode = { "n" },
            "<cmd>BufferLineGoToBuffer -1<cr>",
            desc = "Go to buffer",
        },
    },
}
