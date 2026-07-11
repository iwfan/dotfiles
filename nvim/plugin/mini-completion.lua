local completion = require "mini.completion"
local process_items = function(items, base)
    return completion.default_process_items(items, base, {
        filtersort = "fuzzy",
        kind_priority = { Text = -1, Snippet = 99 },
    })
end

completion.setup {
    lsp_completion = {
        source_func = "omnifunc",
        auto_setup = false,
        process_items = process_items,
    },
    mappings = {
        force_twostep = "<C-Space>",
        force_fallback = "<A-Space>",
        scroll_down = "",
        scroll_up = "",
    },
}

local disabled_completion_filetypes = {
    help = true,
    markdown = true,
    minifiles = true,
    snacks_picker_input = true,
    fff_input = true,
}

local function disable_completion_if_needed(buf)
    if disabled_completion_filetypes[vim.bo[buf].filetype] then
        vim.b[buf].minicompletion_disable = true
    end
end

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("mini-completion-disable", { clear = true }),
    callback = function(ev)
        disable_completion_if_needed(ev.buf)
    end,
})
disable_completion_if_needed(0)

vim.keymap.set("i", "<Tab>", function()
    if vim.fn.pumvisible() == 1 then
        vim.api.nvim_feedkeys(vim.keycode "<C-n>", "n", false)
    else
        vim.api.nvim_feedkeys(vim.keycode "<Tab>", "n", false)
    end
end, { desc = "Next completion item or Tab" })

vim.keymap.set("i", "<S-Tab>", function()
    if vim.fn.pumvisible() == 1 then
        vim.api.nvim_feedkeys(vim.keycode "<C-p>", "n", false)
    else
        vim.api.nvim_feedkeys(vim.keycode "<BS>", "n", false)
    end
end, { desc = "Previous completion item or Backspace" })

vim.keymap.set("i", "<CR>", function()
    if vim.fn.complete_info().selected ~= -1 then
        vim.api.nvim_feedkeys(vim.keycode "<C-y>", "n", false)
    elseif _G.MiniPairs then
        vim.api.nvim_feedkeys(MiniPairs.cr(), "n", false)
    else
        vim.api.nvim_feedkeys(vim.keycode "<CR>", "n", false)
    end
end, { desc = "Accept completion or newline" })
