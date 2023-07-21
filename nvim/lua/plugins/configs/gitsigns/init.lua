require("gitsigns").setup {
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
        map("n", "]c", function()
            if vim.wo.diff then
                return "]c"
            end
            vim.schedule(function()
                gs.next_hunk()
            end)
            return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
            if vim.wo.diff then
                return "[c"
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
        map("n", "\\c", gs.preview_hunk, { desc = "Preview Hunk" })
        map("n", "<bs>c", gs.reset_hunk, { desc = "Reset Hunk" })
        map("v", "<bs>c", function()
            gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { desc = "Reset Hunk" })
        -- Text object
        map({ "o", "x" }, "ic", ":<C-U>Gitsigns select_hunk<CR>")
    end,
}
