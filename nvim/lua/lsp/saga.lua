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

    buf_map("n|gd", "lua vim.lsp.buf.definition()")
    buf_map("n|gD", "Lspsaga preview_definition")
    buf_map("n|gr", "Lspsaga lsp_finder")
    buf_map("n|gi", "Lspsaga implement")
    buf_map("n|K", "Lspsaga hover_doc")
    buf_map("n|gk", "Lspsaga signature_help")

    buf_map("n|<leader>rn", "Lspsaga rename")
    buf_map("n|gx", "Lspsaga code_action")
    buf_map("n|<M-.>", "Lspsaga code_action")
    buf_map("x|gx", "<c-u>Lspsaga range_code_action")

    buf_map("n|\\d", "Lspsaga show_line_diagnostics")
    buf_map("n|]d", "Lspsaga diagnostic_jump_next")
    buf_map("n|[d", "Lspsaga diagnostic_jump_prev")
    buf_map("n|[D", "lua vim.lsp.diagnostic.goto_prev({severity_limit = 'Error'})")
    buf_map("n|]D", "lua vim.lsp.diagnostic.goto_next({severity_limit = 'Error'})")
    buf_map("n|<F5>", "tabnew | lua vim.cmd('e '..vim.lsp.get_log_path())")
    -- buf_map("n|<C-u>", "lua require('lspsaga.action').smart_scroll_with_saga(-1)")
    -- buf_map("n|<C-d>", "lua require('lspsaga.action').smart_scroll_with_saga(1)")

    -- map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
    -- map("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>")
end

return M
