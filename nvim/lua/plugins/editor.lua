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
        'MagicDuck/grug-far.nvim',
        opts= {
            windowCreationCommand = "botright split",
            transient = true,
        },
        keys = {
            {
                "<A-f>",
                mode = "n",
                function()
                    require('grug-far').open({ prefills = { search = vim.fn.expand("<cword>") } })
                end,
                desc = "Spectre",
            },
            {
                "<A-f>",
                mode = "v",
                function()
                    require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })
                end,
                desc = "Spectre",
            },
        },

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
    {
        "johmsalas/text-case.nvim",
        config = function()
            require("textcase").setup {}
            require("telescope").load_extension "textcase"
            vim.api.nvim_set_keymap("n", "<space>c?", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
            vim.api.nvim_set_keymap("v", "<space>c?", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
        end,
    },
}
