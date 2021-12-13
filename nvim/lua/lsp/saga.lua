local M = {}

function M.setup()
    local saga = require "lspsaga"

    saga.init_lsp_saga {
        code_action_icon = "💡",
        code_action_prompt = {
            enable = true,
            sign = true,
            sign_priority = 15,
            virtual_text = false,
        },
        code_action_keys = { quit = { "q", "<ESC>" }, exec = "<CR>" },
        rename_action_keys = {
            quit = "<C-c>",
            exec = "<CR>",
        },
        finder_action_keys = {
            open = { "o", "l", "<CR>" },
            vsplit = "<c-v>",
            split = "<c-s>",
            quit = { "q", "<ESC>" },
            scroll_down = "<C-d>",
            scroll_up = "<C-u>",
        },
        border_style = "round",
    }
end

function M.setup_keymap(bufnr)
    local function buf_map(mode_and_lhs, rhs)
        local mode, lhs = mode_and_lhs:match "([^|]*)|?(.*)"

        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, string.format("<cmd>%s<CR>", rhs), {
            noremap = true,
            silent = true,
        })
    end

    buf_map("n|gd", "Lspsaga lsp_finder")
    buf_map("n|gD", "Lspsaga preview_definition")
    buf_map("n|gr", "Lspsaga lsp_finder")
    -- buf_map("n|gi", "Lspsaga implement")
    -- buf_map("n|K", "Lspsaga hover_doc")
    -- buf_map("n|gk", "Lspsaga signature_help")

    -- buf_map("n|<leader>rn", "Lspsaga rename")
    buf_map("n|<space><enter>", "Lspsaga code_action")
    buf_map("x|<space><enter>", "Lspsaga range_code_action")

    -- buf_map("n|\\d", "Lspsaga show_line_diagnostics")
    -- buf_map("n|]d", "Lspsaga diagnostic_jump_next")
    -- buf_map("n|[d", "Lspsaga diagnostic_jump_prev")
    -- buf_map("n|<C-u>", "lua require('lspsaga.action').smart_scroll_with_saga(-1)")
    -- buf_map("n|<C-d>", "lua require('lspsaga.action').smart_scroll_with_saga(1)")

    -- map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
    -- map("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>")
end

return M
