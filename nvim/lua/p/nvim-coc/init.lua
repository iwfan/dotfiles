local M = {}

---checks if the character preceding the cursor is a space character
---@return boolean true if it is a space character, false otherwise
local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return vim.fn["coc#_select_confirm"]()
    elseif vim.fn["coc#expandableOrJumpable"]() == 1 then
        return t "<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])<CR>"
    elseif has_words_before() then
        return vim.fn["coc#refresh"]()
    elseif check_backspace() then
        return t "<Tab>"
    else
        return vim.fn["coc#refresh"]()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    else
        return t "<C-h>"
    end
end

_G.enter_complete = function()
    if vim.fn.pumvisible() == 1 then
        return vim.fn["coc#_select_confirm"]()
    elseif vim.fn["coc#expandableOrJumpable"]() == 1 then
        return t "<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])<CR>"
    else
        return t "<CR>"
    end
end

_G.prev_snippet = function()
    if vim.fn["coc#expandableOrJumpable"]() == 1 then
        return t "<C-R>=coc#rpc#request('snippetPrev', [])<cr>"
    else
        return t "<C-h>"
    end
end

_G.next_snippet = function()
    if vim.fn["coc#expandableOrJumpable"]() == 1 then
        return t "<C-R>=coc#rpc#request('snippetNext', [])<cr>"
    else
        return t "<C-l>"
    end
end

M.setup = function()
    vim.g.coc_config_home = config_path .. "/lua/p/nvim-coc/"
    vim.g.coc_global_extensions = {
        "coc-css",
        "coc-emmet",
        "coc-eslint",
        "coc-floatinput",
        "coc-html",
        "coc-jest",
        "coc-json",
        "coc-prettier",
        "coc-snippets",
        "coc-lua",
        "coc-tailwindcss",
        "coc-tsserver",
    }

    vim.g.coc_snippet_prev = "<C-h>"
    vim.g.coc_snippet_next = "<C-l>"
end

M.config = function()
    vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true, silent = true })
    vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true, silent = true })
    vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true, silent = true })
    vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true, silent = true })
    vim.api.nvim_set_keymap("i", "<CR>", "v:lua.enter_complete()", { expr = true, silent = true })
    vim.api.nvim_set_keymap("s", "<CR>", "v:lua.enter_complete()", { expr = true, silent = true })
    vim.api.nvim_set_keymap("i", "<C-h>", "v:lua.prev_snippet()", { expr = true, silent = true })
    vim.api.nvim_set_keymap("s", "<C-h>", "v:lua.prev_snippet()", { expr = true, silent = true })
    vim.api.nvim_set_keymap("i", "<C-l>", "v:lua.next_snippet()", { expr = true, silent = true })
    vim.api.nvim_set_keymap("s", "<C-l>", "v:lua.next_snippet()", { expr = true, silent = true })

    vim.api.nvim_set_keymap("n", "\\d", "<Plug>(coc-diagnostic-info)", { silent = true })
    vim.api.nvim_set_keymap("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true })
    vim.api.nvim_set_keymap("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true })
    vim.api.nvim_set_keymap("n", "[D", "<Plug>(coc-diagnostic-prev-error)", { silent = true })
    vim.api.nvim_set_keymap("n", "]D", "<Plug>(coc-diagnostic-next-error)", { silent = true })

    vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { silent = true })
    vim.api.nvim_set_keymap("n", "gD", "<Plug>(coc-declaration)", { silent = true })
    vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", { silent = true })
    vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", { silent = true })

    vim.api.nvim_set_keymap("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })
    vim.api.nvim_set_keymap("n", "<leader>rf", "<Plug>(coc-refactor)", { silent = true })

    vim.api.nvim_set_keymap("n", "<leader><cr>", "<Plug>(coc-codeaction)", { silent = true })
    vim.api.nvim_set_keymap("n", "<leader>qf", "<Plug>(coc-fix-current)", { silent = true })
end

return M
