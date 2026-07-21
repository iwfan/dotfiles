return {
    { "MeanderingProgrammer/render-markdown.nvim", ft = "markdown" },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {},
        -- stylua: ignore
        keys = {
            { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
            { "<leader>qS", function() require("persistence").select() end,desc = "Select Session" },
            { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
            { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                add = { text = "┃" },
                change = { text = "┃" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },
            signs_staged = {
                add = { text = "┃" },
                change = { text = "┃" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
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
                map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
                map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
                map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage Buffer" })
                map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer" })
                map("n", "\\g", gs.preview_hunk, { desc = "Preview Hunk" })
                map("n", "<bs>g", gs.reset_hunk, { desc = "Reset Hunk" })
                map("v", "<bs>g", function()
                    gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
                end, { desc = "Reset Hunk" })
                -- Text object
                map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>")
            end,
            current_line_blame = true,
        },
    },
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        keys = {
            { "<leader>gd", "<Cmd>DiffviewOpen<CR>", desc = "Diffview Open" },
            { "<leader>gh", "<Cmd>DiffviewFileHistory<CR>", desc = "Diffview History" },
        },
        opts = {
            keymaps = {
                view = {
                    { "n", "q", "<Cmd>DiffviewClose<CR>", desc = "Close Diffview" },
                },
                file_panel = {
                    { "n", "q", "<Cmd>DiffviewClose<CR>", desc = "Close Diffview" },
                },
                file_history_panel = {
                    { "n", "q", "<Cmd>DiffviewClose<CR>", desc = "Close Diffview" },
                },
            },
        },
    },
    {
        "NeogitOrg/neogit",
        cmd = "Neogit",
        keys = {
            { "<leader>gg", "<cmd>Neogit<CR>", desc = "Open Neogit" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        opts = {
            integrations = {
                diffview = true,
            },
        },
    },
}
