return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    { "windwp/nvim-ts-autotag", event = "VeryLazy" },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {},
    },
    {
        "andymass/vim-matchup",
        event = "VeryLazy",
        config = function()
            vim.g.matchup_matchparen_offscreen = {}
        end,
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
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "▏" },
            scope = { enabled = false },
        },
    },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()
            require("telescope").load_extension "refactoring"
        end,
        keys = {
            {
                "<space>r?",
                mode = { "n", "x" },
                function()
                    require("telescope").extensions.refactoring.refactors()
                end,
                desc = "Refactor This",
            },
            {
                "<leader>re",
                mode = "x",
                function()
                    require("refactoring").refactor "Extract Function"
                end,
            },
            {
                "<leader>rf",
                mode = "x",
                function()
                    require("refactoring").refactor "Extract Function To File"
                end,
            },
            {
                "<leader>rv",
                mode = "x",
                function()
                    require("refactoring").refactor "Extract Variable"
                end,
            },
            {
                "<leader>rI",
                mode = "n",
                function()
                    require("refactoring").refactor "Inline Function"
                end,
            },
            {
                "<leader>ri",
                mode = { "n", "x" },
                function()
                    require("refactoring").refactor "Inline Variable"
                end,
            },
            {
                "<leader>rb",
                mode = "n",
                function()
                    require("refactoring").refactor "Extract Block"
                end,
            },
            {
                "<leader>rbf",
                mode = "n",
                function()
                    require("refactoring").refactor "Extract Block To File"
                end,
            },
            {
                "<space>rp",
                mode = "n",
                function()
                    require("refactoring").debug.printf()
                end,
                "insert debug statement",
            },
            {
                "<space>rs",
                mode = { "x", "n" },
                function()
                    require("refactoring").debug.print_var()
                end,
                desc = "show variables",
            },
            {
                "<space>rc",
                mode = "n",
                function()
                    require("refactoring").debug.cleanup {}
                end,
            },
        },
    },
    {
        "johmsalas/text-case.nvim",
        config = function()
            require("textcase").setup {}
            require("telescope").load_extension "textcase"
            vim.api.nvim_set_keymap("n", "<space>c?", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
            vim.api.nvim_set_keymap("v", "<space>c?", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
        end,
    },
    -- {
    --     "chikko80/error-lens.nvim",
    --     event = "BufRead",
    --     dependencies = {
    --         "nvim-telescope/telescope.nvim"
    --     },
    --     opts = {
    --         colors = {
    --             error_fg = "#E67E80",
    --             error_bg = "#543A48",
    --             warn_fg = "#DBBC7F",
    --             warn_bg = "#4D4C43",
    --             info_fg = "#A7C080",
    --             info_bg = "#425047",
    --             hint_fg = "#7FBBB3",
    --             hint_bg = "#3A515D"
    --         }
    --     },
    -- }
}
