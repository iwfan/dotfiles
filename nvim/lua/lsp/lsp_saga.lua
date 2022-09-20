local saga = require "lspsaga"
local diagnostic = require "lspsaga.diagnostic"
local codeaction = require "lspsaga.codeaction"

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

    vim.keymap.set("n", "\\d", diagnostic.show_line_diagnostics, bufopts)
    vim.keymap.set("n", "[d", diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "]d", diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "[D", function()
        diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
    end, bufopts)
    vim.keymap.set("n", "]D", function()
        diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
    end, bufopts)

    vim.keymap.set("n", "<space><enter>", codeaction.code_action, bufopts)
    vim.keymap.set("v", "<space><enter>", function()
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
        codeaction.range_code_action()
    end, bufopts)
end
