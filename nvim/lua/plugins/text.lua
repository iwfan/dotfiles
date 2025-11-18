return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    { "windwp/nvim-ts-autotag", event = "VeryLazy", opts = {} },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {},
    },
    {
        "folke/ts-comments.nvim",
        opts = {},
        event = "VeryLazy",
        enabled = vim.fn.has "nvim-0.10.0" == 1,
    },
    {
        "mg979/vim-visual-multi",
        event = "VeryLazy",
        init = function()
            vim.g.VM_default_mappings = 0
            vim.g.VM_maps = {
                ["Add Cursor Down"] = "<A-n>",
                ["Add Cursor Up"] = "<A-p>",
            }
        end,
    },
}
