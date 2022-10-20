local saga = require "lspsaga"

saga.init_lsp_saga {
    diagnostic_header = { " ", " ", " ", " " },
    -- use emoji lightbulb in default
    code_action_icon = "💡",
    -- same as nvim-lightbulb but async
    code_action_lightbulb = {
        enable = true,
        enable_in_insert = true,
        cache_code_action = true,
        sign = true,
        update_time = 150,
        sign_priority = 20,
        virtual_text = false,
    },
    -- finder icons
    finder_icons = {
        def = "  ",
        ref = "  ",
        link = "  ",
    },
    finder_action_keys = {
        open = "<CR>",
    },
}

return function(bufnr)
    local bufopts = { silent = true, buffer = bufnr }
    vim.keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "<M-r>", "<cmd>Lspsaga rename<CR>", bufopts)
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)

    vim.keymap.set("n", "\\D", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
    vim.keymap.set("n", "\\d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts)
    vim.keymap.set("n", "[d",  "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
    vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
    vim.keymap.set("n", "[D", function()
         require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end, bufopts)
    vim.keymap.set("n", "]D", function()
        require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
    end, bufopts)

    vim.keymap.set({"n","v"}, "<space><enter>", "<cmd>Lspsaga code_action<CR>", bufopts)
end
