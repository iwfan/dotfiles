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
}
