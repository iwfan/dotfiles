return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        "windwp/nvim-ts-autotag",
        event ={ "BufReadPost", "BufNewFile" },
        opts = {}
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },
    {
        "folke/ts-comments.nvim",
        opts = {},
        event = { "BufReadPost", "BufNewFile" },
        enabled = vim.fn.has "nvim-0.10.0" == 1,
    },
    {
        "mg979/vim-visual-multi",
        event = { "BufReadPost", "BufNewFile" },
        keys = { "<C-n>", "<A-n>", "<A-p>" },
        init = function()
            vim.g.VM_default_mappings = 0
            vim.g.VM_maps = {
                ["Add Cursor Down"] = "<A-n>",
                ["Add Cursor Up"] = "<A-p>",
            }
        end,
    },
    -- {
    --     "johmsalas/text-case.nvim",
    --     dependencies = { "nvim-telescope/telescope.nvim" },
    --     config = function()
    --         require("textcase").setup({})
    --         require("telescope").load_extension("textcase")
    --     end,
    --     keys = {
    --         "ga", -- Default invocation prefix
    --         { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
    --     },
    --     cmd = {
    --         "TextCaseOpenTelescope",
    --         "TextCaseOpenTelescopeQuickChange",
    --         "TextCaseOpenTelescopeLSPChange",
    --         "TextCaseStartReplacingCommand",
    --     },
    -- }
}
