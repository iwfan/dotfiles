local M = {}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s" ~= nil
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
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
    else
        return t "<C-g>u<CR><c-r>=coc#on_enter()<CR>"
    end
end

local function setup_keymapping()
    vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
    vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
    vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
    vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
    vim.api.nvim_set_keymap("i", "<cr>", "v:lua.enter_complete()", { expr = true })

    vim.api.nvim_set_keymap(
        "n",
        "<C-f>",
        [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]],
        { expr = true, silent = true, nowait = true }
    )
    vim.api.nvim_set_keymap(
        "n",
        "<C-b>",
        [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]],
        { expr = true, silent = true, nowait = true }
    )
    vim.api.nvim_set_keymap(
        "i",
        "<C-f>",
        [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"]],
        { expr = true, silent = true, nowait = true }
    )
    vim.api.nvim_set_keymap(
        "i",
        "<C-b>",
        [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"]],
        { expr = true, silent = true, nowait = true }
    )
    vim.api.nvim_set_keymap(
        "v",
        "<C-f>",
        [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]],
        { expr = true, silent = true, nowait = true }
    )
    vim.api.nvim_set_keymap(
        "v",
        "<C-b>",
        [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]],
        { expr = true, silent = true, nowait = true }
    )
end

local function setup_global_extensions()
    vim.g.coc_global_extensions = {
        "coc-css",
        "coc-diagnostic",
        "coc-emmet",
        "coc-eslint",
        "coc-html",
        "coc-json",
        "coc-prettier",
        "coc-tabnine",
        "coc-tailwindcss",
        "coc-tsserver",
        "coc-vetur",
        "coc-vimlsp",
        "coc-webpack",
        "coc-yaml",
        "coc-sumneko-lua"
    }
end

M.setup = function()
    setup_global_extensions()
    setup_keymapping()
end
return M
