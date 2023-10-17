return {
    {
        "numToStr/Comment.nvim",
        opts = {
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        },
        keys = {
            {
                "<C-/>",
                mode = { "n", "x" },
                function()
                    local mode = vim.fn.mode()
                    local api = require "Comment.api"

                    if mode == "V" then
                        local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
                        vim.api.nvim_feedkeys(esc, "nx", false)
                        api.toggle.linewise(vim.fn.visualmode())
                    else
                        if vim.v.count == 0 then
                            api.toggle.linewise.current()
                        else
                            api.toggle.linewise.count(vim.v.count)
                        end
                    end
                end,
                desc = "Comment line",
            },
        },
        event = "VeryLazy",
    },
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
                ["Add Cursor Down"] = "<M-n>",
                ["Add Cursor Up"] = "<M-p>",
            }
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        event = "VeryLazy",
        dependencies = { "kevinhwang91/promise-async" },
        config = function()
            vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.keymap.set("n", "zR", require("ufo").openAllFolds)
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
            require("ufo").setup()
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "▏" },
            scope = { enabled = false }
        }
    },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()
            require("telescope").load_extension("refactoring")
        end,
        keys = {
            { "<space>r?", mode = { "n", "x" }, function() require('telescope').extensions.refactoring.refactors() end, desc = "Refactor This", },
            { "<leader>re", mode = "x", function() require('refactoring').refactor('Extract Function') end },
            { "<leader>rf", mode = "x", function() require('refactoring').refactor('Extract Function To File') end },
            { "<leader>rv", mode = "x", function() require('refactoring').refactor('Extract Variable') end },
            { "<leader>rI", mode = "n", function() require('refactoring').refactor('Inline Function') end },
            { "<leader>ri", mode = { "n", "x" }, function() require('refactoring').refactor('Inline Variable') end },
            { "<leader>rb", mode = "n", function() require('refactoring').refactor('Extract Block') end },
            { "<leader>rbf", mode = "n", function() require('refactoring').refactor('Extract Block To File') end },
            { "<space>rp", mode = "n", function() require('refactoring').debug.printf() end, "insert debug statement" },
            { "<space>rs", mode = {"x", "n"}, function() require('refactoring').debug.print_var() end, desc = "show variables" },
            { "<space>rc", mode = "n", function() require('refactoring').debug.cleanup({}) end },
        },
    },
    -- {
    --     "keaising/im-select.nvim",
    --     opts = {},
    -- },
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
