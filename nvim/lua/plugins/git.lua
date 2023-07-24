return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]g", function()
                    if vim.wo.diff then
                        return "]g"
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true })

                map("n", "[g", function()
                    if vim.wo.diff then
                        return "[g"
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true })

                -- Actions
                map({ "n", "v" }, "<space>hs", ":Gitsigns stage_hunk<CR>")
                map({ "n", "v" }, "<space>hr", ":Gitsigns reset_hunk<CR>")
                map("n", "<space>hS", gs.stage_buffer, { desc = "Stage Buffer" })
                map("n", "<space>hR", gs.reset_buffer, { desc = "Reset Buffer" })
                map("n", "\\g", gs.preview_hunk, { desc = "Preview Hunk" })
                map("n", "<bs>g", gs.reset_hunk, { desc = "Reset Hunk" })
                map("v", "<bs>g", function()
                    gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
                end, { desc = "Reset Hunk" })
                -- Text object
                map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>")
            end,
        },
    },
    {
        "NeogitOrg/neogit",
        opts = {},
        dependencies = "nvim-lua/plenary.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<Space>g",
                mode = "n",
                "<cmd>Neogit<cr>",
                desc = "neogit",
            },
        },
    },
    -- {
    --     "akinsho/toggleterm.nvim",
    --     version = "*",
    --     event = "VeryLazy",
    --     config = function()
    --         require "plugins.configs.toggleterm"
    --     end,
    -- },
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        opts = {},
        keys = {
            {
                "<Space>d",
                mode = "n",
                function()
                    if next(require("diffview.lib").views) == nil then
                        vim.cmd "DiffviewOpen"
                    else
                        vim.cmd "DiffviewClose"
                    end
                end,
                desc = "neogit",
            },
        },
    },
}
